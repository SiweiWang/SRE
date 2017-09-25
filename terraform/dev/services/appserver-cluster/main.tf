# 2 tire application terraform file

provider "aws"{
    region = "us-east-1"
}

module "appserver_cluster"{
    source = "../../../modules/services/appserver-cluster"

    cluster_name     = "appserver-dev"
    web_service_port = 8080
    instance_size    = "t2.micro" 
    
    enable_autoscaling  = true  # Auto scaling can be turned off to save cost
    min_size            = 1
    max_size            = 1
}

terraform{
  backend "s3" {
    bucket = "sre-terraform-state-2017"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}