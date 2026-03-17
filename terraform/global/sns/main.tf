module "sns" {
    source = "../../modules/sns"
    email = var.email
}