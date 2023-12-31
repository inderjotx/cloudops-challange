
resource "aws_cloudfront_origin_access_identity" "my_oci_identity" {
  comment = "Some Random ACI"
}



resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.static_site_bucket.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
    
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.my_oci_identity.cloudfront_access_identity_path
    }
  }


  aliases = var.alias-cloudfront



  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some Random Comment"
  default_root_object = "index.html"


  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 60
    max_ttl                = 3600
  }

  
  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    acm_certificate_arn = var.certificate-acm_certificate_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}


