## 이번 주 실습/과제 PR

- 주차:
- GitHub ID:
- 브랜치: `week{N}/{github-id}`
- 제출 폴더: `submissions/{github-id}/`

> 리뷰 후 머지됩니다. `practice/`는 건드리지 않았는지 확인해주세요.

### DoD 체크리스트
- [ ] `terraform init` 성공, `.terraform.lock.hcl` 커밋됨
- [ ] `terraform apply` 성공 (`state list` 출력 아래에 첨부)
- [ ] **`terraform destroy` 완료 & 콘솔에서 리소스 0개 확인**
- [ ] `git status`로 자격증명 / `*.tfvars` / `*.tfstate` 커밋 안 됐는지 확인

### 오늘 만든 것 (요약)


### 막힌 지점 / 질문


### destroy 전 `terraform state list`
```
(여기에 붙여넣기: destroy하면 확인할 수 없으므로 미리 복사해둔 출력)
```

### destroy 후 `terraform state list`
```
(완전히 빈 출력이어야 함: 데이터 소스까지 함께 삭제됩니다)
```
