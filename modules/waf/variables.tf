variable "region" {
  description = "AWS region to deploy the WAF (must be us-east-1 for CloudFront)"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name of the WAF ACL"
  type        = string
  default     = "geo-fencing-web-acl"
}

variable "description" {
  description = "WAF to allow only India traffic"
  type        = string
  default     = "Geo-Fencing WAF for India only"
}

variable "scope" {
  description = "WAF Scope: REGIONAL for ALB, CLOUDFRONT for CloudFront"
  type        = string
  default     = "REGIONAL"
}

variable "metric_name" {
  description = "CloudWatch metric name for the WAF"
  type        = string
  default     = "geoFencingACL"
}

variable "allowed_country_codes" {
  description = "List of country codes to allow"
  type        = list(string)
  default     = ["IN"]
}

variable "tags" {
  description = "Tags to apply to the WAF"
  type        = map(string)
  default = {
    Name = "GeoFencingWAF"
  }
}

variable "associate_to_resource" {
  description = "Whether to associate the WAF with a resource (like ALB or CloudFront)"
  type        = bool
  default     = false
}

variable "resource_arn" {
  description = "ARN of the resource (ALB or CloudFront) to associate with the WAF"
  type        = string
  default     = ""
}
