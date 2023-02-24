################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "environment" {
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
  type        = string
  default     = "dev"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
  default     = "example"
}

################################################################################
## network / security
################################################################################
variable "private_subnet_names" {
  description = "List of private subnet names for the autoscaling group to launch instances in."
  type        = list(string)
  default     = []
}

variable "public_subnet_names" {
  description = "List of public subnet names for the ALB"
  type        = list(string)
  default     = []
}

variable "vpc_name" {
  description = "List of VPC names to filter for"
  type        = string
  default     = null
}

################################################################################
## acm
################################################################################
variable "acm_domain_name" {
  description = "Domain name the ACM Certificate belongs to"
  type        = string
}

variable "acm_subject_alternative_names" {
  description = "Subject alternative names for the ACM Certificate"
  type        = list(string)
  default     = []
}
