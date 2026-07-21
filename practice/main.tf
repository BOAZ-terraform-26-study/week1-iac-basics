# TODO(L1): S3 버킷 리소스를 선언하세요.
#   - 리소스 타입: aws_s3_bucket
#   - 로컬 이름: "lab"
#   - bucket 인자: "${var.project_name}-lab"  (글로벌 유니크)
# resource "aws_s3_bucket" "lab" {
#   bucket = ...
# }

# TODO(L1): 퍼블릭 접근 차단 (aws_s3_bucket_public_access_block)
#   - bucket = aws_s3_bucket.lab.id
#   - 네 가지 옵션 모두 true
# resource "aws_s3_bucket_public_access_block" "lab" {
#   ...
# }

# TODO(L3-⭐): 버킷 versioning 활성화 (aws_s3_bucket_versioning)
