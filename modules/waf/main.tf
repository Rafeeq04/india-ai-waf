provider "aws" {
  region = var.region
}

resource "aws_wafv2_web_acl" "geo_fencing_acl" {
  name        = var.name
  description = var.description
  scope       = var.scope

  default_action {
    block {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.metric_name
    sampled_requests_enabled   = true
  }

  rule {
    name     = "allow-only-india"
    priority = 1

    action {
      allow {}
    }

    statement {
      geo_match_statement {
        country_codes = var.allowed_country_codes
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AllowOnlyIndia"
      sampled_requests_enabled   = true
    }
  }

  tags = var.tags
}

resource "aws_wafv2_web_acl_association" "attach" {
  count         = var.associate_to_resource ? 1 : 0
  resource_arn  = var.resource_arn
  web_acl_arn   = aws_wafv2_web_acl.geo_fencing_acl.arn
}
