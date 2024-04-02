variable "instance_type" {
  type        = string
  description = "type of instance to create on AWS"

validation {
    condition     =  contains(["t3.nano","t3.micro"],var.instance_type)
    error_message = "unauthorized instance type"
  }
}