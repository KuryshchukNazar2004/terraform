variable "bucket_name" {
  type = string
  default = "992382482319-my-tf-test-bucket-new"
}
variable "slack_webhook_url" {
  type = string
}
variable "slack_email" {
  type = string
}
variable "use_locals" {
  type = bool
  default = true
}
# variable "slack_webhook_url" {
#     type = string
# }
