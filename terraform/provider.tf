terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
  backend "s3" {
    bucket  = "movie-react-app-mame-azad-tfstate"
    key     = "tf_state_ui"
    region  = "eu-west-3"
    encrypt = true
  }
}