# TODO(L1): 내 AWS 계정 정보를 조회하는 데이터 소스를 선언하세요.  (워크북 A-4)
#   - 블록 종류: data  (resource 아님!)
#   - 타입: aws_caller_identity   /   이름: "current"
#   - 인자 없음: 중괄호 안이 비어 있는 것이 맞습니다
#   - 참조할 때: data.aws_caller_identity.current.account_id
# data "aws_caller_identity" "current" {}

# TODO(L1): S3 버킷 리소스를 선언하세요.  (워크북 A-5)
#   - 리소스 타입: aws_s3_bucket
#   - 로컬 이름: "lab"
#   - bucket 인자: "${var.project_name}-lab-${data.aws_caller_identity.current.account_id}"
#     계정번호가 뒤에 붙으므로 버킷명의 전역 유일성이 보장됩니다
# resource "aws_s3_bucket" "lab" {
#   bucket = ...
# }

# TODO(L1): 퍼블릭 접근 차단 (aws_s3_bucket_public_access_block)  (워크북 B-3)
#   - bucket = aws_s3_bucket.lab.id
#   - 네 가지 옵션 모두 true
# resource "aws_s3_bucket_public_access_block" "lab" {
#   ...
# }

# TODO(L3-⭐): 버킷 versioning 활성화 (aws_s3_bucket_versioning)  (워크북 B-4)
