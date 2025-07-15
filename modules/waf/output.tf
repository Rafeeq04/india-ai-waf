output "waf_acl_id" {
  description = "ID of the WAF ACL"
  value       = aws_wafv2_web_acl.geo_fencing_acl.id
}

output "waf_acl_arn" {
  description = "ARN of the WAF ACL"
  value       = aws_wafv2_web_acl.geo_fencing_acl.arn
}

output "waf_name" {
  description = "Name of the WAF ACL"
  value       = aws_wafv2_web_acl.geo_fencing_acl.name
}
