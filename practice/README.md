# Week1 실습 — 첫 S3 버킷 apply/destroy

## 미션
`main.tf`와 `outputs.tf`의 `# TODO`를 채워 S3 버킷을 만들고 지웁니다.

## 실행 순서
```bash
cp example.tfvars terraform.tfvars   # project_name을 본인 것으로 수정
terraform init
terraform plan       # "Plan: 1 to add" (또는 3 to add) 확인
terraform apply      # yes
terraform state list # 생성된 리소스 확인
terraform destroy    # yes  (실습 끝나면 반드시!)
```

## 난이도 가이드
- **L1 (필수)**: 버킷 + public access block + output. 여기까지 하면 완료(DoD 충족).
- **L2**: 태그 공통화, 변수 추가
- **L3-⭐**: versioning, lifecycle 규칙

## 막히면 여기 (힌트 단계)
1. `aws_s3_bucket` 문서: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
2. 버킷명이 겹치면 `project_name`을 더 고유하게
3. 그래도 안 되면 `../solution/` 참고
