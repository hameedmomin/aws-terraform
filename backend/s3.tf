/*resource "aws_s3_bucket_object" "mybuckett" {
  bucket                  = "hameed"
  key                     = "my-storage"
}*/
resource "aws_s3_bucket" "mybucket" {
  bucket = "hameed"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
output "bukcetname" {
  value = aws_s3_bucket.mybucket
}