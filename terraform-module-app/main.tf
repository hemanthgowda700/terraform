#dev infrastructure

module "dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "hpg-infra-app-bucket"
    instance_count = 1
    instance_type = "t3.small"
    ami = "ami-020cba7c55df1f615" #ubuntu
    hash_key = "studentID"
}

module "prod-infra" {
    source = "./infra-app"
    env = "prod"
    bucket_name = "hpg-infra-app-bucket"
    instance_count = 1
    instance_type = "t3.small"
    ami = "ami-020cba7c55df1f615" #ubuntu
    hash_key = "studentID"
}

module "stag-infra" {
    source = "./infra-app"
    env = "stag"
    bucket_name = "hpg-infra-app-bucket"
    instance_count = 1
    instance_type = "t3.small"
    ami = "ami-020cba7c55df1f615" #ubuntu
    hash_key = "studentID"
}


