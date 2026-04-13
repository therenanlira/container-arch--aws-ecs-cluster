data "terraform_remote_state" "aws_vpc" {
  backend = "s3"
  config = {
    bucket = "container-arch--terraform-backend"
    key    = "env:/${terraform.workspace}/container-arch/aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
