locals {
  ca_cert_identifier = "rds-ca-rsa4096-g1"
#   ca_cert_identifier = "rds-ca-2019"
  region = "us-east-1"
  apply_immediately = "true"
}

# #terraform.tfvars
# region = "us-east-1"
# access_key = "<YOUR AWS CONSOLE ACCESS ID>"
# secret_key = "<YOUR AWS CONSOLE SECRET KEY>"

# #terraform.tfvars
# region = "us-east-1"
# ca_cert_identifier = "rds-ca-2019"