variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "s3_bucket_name" {
  type    = string
  default = "movie-react-app-mame-azad"
}
variable "s3_tf_state_bucket_name" {
  type    = string
  default = "movie-react-app-mame-azad-tfstate"
}