# 2 tire application terraform file

provider "aws"{
    region = "us-east-1"
}


module "appserver_cluster"{
    source = "../../../modules/services/appserver-cluster"

    cluster_name     = "appserver-dev"
    web_service_port = 8080
    instance_size    = "t2.medium" 

    enable_autoscaling  = false  # Auto scaling is turn on only for production
    min_size         = 2
    max_size         = 2
}

terraform{
  backend "s3" {
    bucket = "sre-terraform-state-2017"
    key    = "global/s3/stage/terraform.tfstate"
    region = "us-east-1"
  }
}