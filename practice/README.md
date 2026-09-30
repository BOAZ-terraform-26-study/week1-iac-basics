# Week1 실습: 첫 S3 버킷 apply/destroy

> 자세한 진행은 **[실습 워크북 PDF](../lecture/실습워크북.pdf)** 를 위에서 아래로 따라가세요. 이 파일은 요약입니다.

## 미션
`main.tf`와 `outputs.tf`의 `# TODO`를 채워 S3 버킷을 만들고 지웁니다.

## 실행 순서
```bash
cp example.tfvars terraform.tfvars   # project_name을 본인 GitHub ID로 수정
terraform init                       # provider 다운로드 (한 번)
terraform validate                   # 문법 검사 (init 이후에 실행)
terraform plan                       # "Plan: 1 to add" 확인
terraform apply                      # yes
terraform state list                 # 리소스 + 데이터 소스 확인
terraform show                       # state 전체 보기
terraform destroy                    # yes  (실습이 끝나면 반드시 실행)
```

## 난이도 가이드
- **L1 (필수)**: 데이터 소스 + 버킷 + public access block + output. 여기까지 하면 완료(DoD 충족).
- **L2**: 태그 공통화, 변수 추가
- **L3-⭐**: versioning, lifecycle 규칙

## 막힐 때 참고할 자료 (힌트 단계)
1. `aws_s3_bucket` 문서: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
2. `aws_caller_identity` 데이터 소스: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
3. `InvalidBucketName`이 나면 버킷명이 63자를 넘었는지 확인 (`project_name`은 40자 이내)
4. 그래도 안 되면 `../solution/` 참고
