#create an S3 bucket and versioning
resource "aws_s3_bucket" "my_bucket" {
    bucket = "new-bucket"
    region = var.region
    avalability_zone = var.zone1

    versioning {
        enabled = true
    }
    tags = {
        Name = "New-bucket"
    }
}

#bucket to allow public read access
resource "aws_s3_bucket_acl" "bucket_acl" {
    bucket = aws_s3_bucket.my_bucket.id
    acl = "public-read"
}

#create bucket policy that allows read-only access to a specific IAM user
resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.my_bucket.id
    policy = data. aws_iam_policy_document.allow_read-only_access.json
}

data "aws_iam_policy_document" "allow_read_only_access" {
    statement {
        principals {
            type = "aws"
            identifiers ["6836330111377"]
        }
        actions = [
            "s3:GetObjet",
            "s3:ListBucket",
        ]
        resources = [
            aws_s3_bucket.my_bucket.arn,
            "${aws_s3_bucket.my_bucket.arn}/*",
        ]
    }
}
/*
#Enabling public access
resource "aws_s3_bucket_public_access_block" "example" {
    bucket = aws_s3_bucket.new-bucket.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}
*/
