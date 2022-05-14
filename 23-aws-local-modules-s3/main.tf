module "arivu_aws_s3_bucket" {
    source = "./modules/s3"
    vers = var.vers
    bucketname = var.bucketname

}
