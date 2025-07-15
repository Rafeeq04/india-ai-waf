module "waf" {
  source                = "./modules/waf"   # ✅ Path to your local module
  region                = "ap-south-1"      # ✅ Replace with your actual region if attaching to ALB (e.g., Mumbai)
  scope                 = "REGIONAL"        # ✅ "REGIONAL" for ALB/API Gateway, "CLOUDFRONT" for CloudFront

  allowed_country_codes = ["IN"]            # ✅ Allow only India

  associate_to_resource = true              # ✅ Set to true if you want to attach this WAF to ALB or CloudFront

  resource_arn          = "arn:aws:elasticloadbalancing:ap-south-1:149101264684:loadbalancer/app/Prod-India-AI-ALB/f02228ca13a610f0"
  # 🔁 ✅ Replace this with your actual ALB or CloudFront ARN
}
