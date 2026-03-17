terraform{
    backend "s3"{
        bucket = "cloud-provider-platform-terraform-state"
        key = "stage/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform_state_lock"
        encrypt = true
    }
}