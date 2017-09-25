variable "cluster_name"{
    description = "the name of the cluster"
}

variable "web_service_port"{
    description = "The port the server will use for http requests"
    default     = 8080
}

variable "instance_size"{
    description = "The size of the instance"
}

variable "min_size"{
    description = "The min size of the instance for the applicaiton asg"
}

variable "max_size"{
    description = "The max size of the instance for the application asg"
}

variable "enable_autoscaling"{
    description = "The flag to enable/disable asg policy"
}


