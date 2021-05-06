variable "region" {
  default = "us-west-1"
}
variable "tags" {
  default = {
    Product     = "inf"
    budget-area = "inf"
    group       = "inf"
    env         = "sandbox"
    Source      = "https://github.com/2uinc/tf-infrastructure"
  }
}
