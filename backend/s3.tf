# ---------------------------------------------
# S3
# ---------------------------------------------
resource "aws_s3_bucket" "terraform_backend" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "terraform_backend" {
  bucket                  = aws_s3_bucket.terraform_backend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_policy.terraform_backend]
}

resource "aws_s3_bucket_policy" "terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id
  policy = data.aws_iam_policy_document.terraform_backend.json
}

data "aws_iam_policy_document" "terraform_backend" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = ["arn:aws:s3:::${var.bucket_name}"]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::730335438178:user/terraform",
      ]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["arn:aws:s3:::${var.bucket_name}/data"]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::730335438178:user/terraform",
      ]
    }
  }
}