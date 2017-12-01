
data "template_file" "user_data"{
    template = "${file("user-data.sh")}"

    vars{
        web_service_port = "${var.web_service_port}"
    }
}

data "aws_availability_zones" "all" {}

# Define lanch config for auto scaling group
resource "aws_launch_configuration" "app"{
    image_id        = "ami-40d28157"
    instance_type   = "${var.instance_size}"
    security_groups = ["${aws_security_group.app.id}"]

    user_data       = "${data.template_file.user_data.rendered}"

    lifecycle{
        create_before_destroy = true
    }
}

# define application security group
resource "aws_security_group" "app"{
    name    = "${var.cluster_name}-app"

    ingress{
        from_port   = "${var.web_service_port}"
        to_port     = "${var.web_service_port}"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle{
        create_before_destroy = true
    }
}

# define auto scaling group
resource "aws_autoscaling_group" "app"{
    launch_configuration = "${aws_launch_configuration.app.id}"
    availability_zones    = ["${data.aws_availability_zones.all.names}"]
    
    load_balancers        = ["${aws_elb.app.name}"]
    health_check_type    = "ELB"

    min_size = "${var.min_size}"
    max_size = "${var.max_size}"

    tag{
        key                 = "Name"
        value               = "terraform-asg-app"
        propagate_at_launch = true
    }
}

# define elb for asg
resource "aws_elb" "app"{
    name                = "${var.cluster_name}-elb-app"
    availability_zones   = ["${data.aws_availability_zones.all.names}"]
    security_groups      = ["${aws_security_group.elb.id}"]

    listener{
        lb_port             = 80
        lb_protocol         = "http"
        instance_port       = "${var.web_service_port}"
        instance_protocol   = "http"
    }

    health_check{
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        interval            = 30
        target              = "HTTP:${var.web_service_port}/"
    }
}

# define elb security group 
resource "aws_security_group" "elb"{
    name = "${var.cluster_name}-elb"

    ingress{
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# define scaling policy
resource "aws_autoscaling_schedule" "scale_out_during_business_hours"{
    count = "${var.enable_autoscaling}"

    scheduled_action_name  = "scale_out_during_business_hours"
    min_size               = "${var.min_size}"
    max_size               = "${var.max_size}"
    desired_capacity       = "${var.max_size}"
    recurrence             = "0 9 * * * "

    autoscaling_group_name = "${aws_autoscaling_group.app.name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night"{
    count = "${var.enable_autoscaling}"

    scheduled_action_name  = "scale_in_at_night"
    min_size               = "${var.min_size}"
    max_size               = "${var.max_size}"
    desired_capacity       = "${var.min_size}"
    recurrence             = "0 17 * * * "

    autoscaling_group_name = "${aws_autoscaling_group.app.name}"
}

# define cloud watch alters for high CPU
resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization"{
    alarm_name = "${var.cluster_name}_high_cpu_utilization"
    namespace  = "AWS/EC2"
    metric_name = "CPUUtilization"

    dimensions  = {
        AutoScalingGroupName = "${aws_autoscaling_group.app.name}"
    }

    comparison_operator = "GreaterThanThreshold"
    evaluation_periods   = 1
    period               = 180
    statistic            = "Average"
    threshold            = 90
    unit                 = "Percent"
}

# define cloud watch alters for low cpu credits
resource "aws_cloudwatch_metric_alarm" "low_cpu_credit_balance"{
    # cpu credit only applys to t type instance
    count = "${format("%.1s", var.instance_sizeØ) == "t" ? 1 : 0}"

    alarm_name = "${var.cluster_name}_low_cpu_credit_balance"
    namespace  = "AWS/EC2"
    metric_name = "CPUCreditBalance"

    dimensions  = {
        AutoScalingGroupName = "${aws_autoscaling_group.app.name}"
    }

    comparison_operator = "LessThanThreshold"
    evaluation_periods   = 1
    period               = 180
    statistic            = "Minimum"
    threshold            = 10
    unit                 = "Count"

}