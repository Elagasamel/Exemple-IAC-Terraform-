resource "aws_elb" "arivu-aws-elb-web" {
  name = "arivu-aws-elb-web"

  # The same availability zone as our instance
  subnets = ["${var.subnet_id}"]

  security_groups = ["${var.sg_id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  # The instance is registered automatically
  instances                   = ["${var.ec2_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}

resource "aws_lb_cookie_stickiness_policy" "arivu_lbpolicy" {
  name                     = "lbpolicy"
  load_balancer            = aws_elb.arivu-aws-elb-web.id
  lb_port                  = 80
  cookie_expiration_period = 600
}
