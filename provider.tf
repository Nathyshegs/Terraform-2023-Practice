# provider "aws" {
#     region     = "${var.region}"
#     access_key = "${var.access_key}"
#     secret_key = "${var.secret_key}"
# }

provider "aws" {
    # region     = "${var.region}"
    region = local.region
    profile = "default"
    
}