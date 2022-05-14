resource "aws_route53_zone" "arivu-aws-route53" {
  name = "arivu.in"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "arivu-route-53-record" {
  zone_id = aws_route53_zone.arivu-aws-route53.zone_id
  name    = "www.arivu.in"
  type    = "A"
  ttl     = "300"
  records = ["${var.public_ip}"]
}

output "name_server"{
  value=aws_route53_zone.arivu-aws-route53.name_servers
}