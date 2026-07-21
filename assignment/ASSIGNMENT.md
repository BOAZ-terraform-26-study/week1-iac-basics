# Week1 과제① (다음 리뷰: Week2)

## 목표
- 본인 AWS 계정에서 리소스 1개를 **직접** 생성 -> state 확인 -> destroy 하는 라이프사이클을 혼자 완주한다.

## 필수 (Must)
1. 개인 계정에 리소스 1개를 Terraform으로 생성
   - S3 버킷 또는 무과금 리소스(`aws_ssm_parameter`, `aws_cloudwatch_log_group` 등)도 허용
2. `terraform state list`로 생성 확인
3. **`terraform destroy`로 제거 후 콘솔에서 사라진 것 확인**
4. Week2 예습: `resource` 참조로 생기는 의존성, `data source`, VPC/Subnet/EC2 기본 문법 훑기

## 제출물 (repo: `assignments`, 폴더: `round1-week1/{github-id}/`)
- [ ] 코드 (`.tf` 파일들, `terraform.tfvars`는 제외)
- [ ] 워크북 (`workbook-week1.md`)
- [ ] destroy 완료 스크린샷 또는 `state list` 빈 출력
- PR로 제출, DoD 체크리스트 통과

## 심화 (Optional ⭐)
- 태그 표준화 + output 2개 이상 + versioning 활성화

## 리뷰 방식
- Week2 과제 리뷰 5분에 대표 PR 1개 화면 공유 + 트러블슈팅 1개 공유
