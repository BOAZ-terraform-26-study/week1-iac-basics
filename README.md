# Week 1. IaC 개념 & Terraform 기초 `[비대면]`

> 📘 **[이번 주 강의자료(핸즈온 워크북) PDF »](./lecture/강의자료.pdf)** — 실습은 이 문서를 위에서 아래로 따라가며 진행합니다.

> 이번 주가 끝나면: **S3 버킷을 코드로 `apply`해서 만들고, `state`로 확인하고, `destroy`로 지울 수 있다.**

## 0. 메타 정보
| 항목 | 내용 |
|------|------|
| 일시 | 2026-MM-DD · 60분 |
| 방식 | 비대면 (Discord) |
| 선행 | [week0 SETUP](https://github.com/BOAZ-terraform-26-study/week0-ot) 완료 (Terraform·AWS CLI 설치, `aws configure`) |
| 산출물 | 실습 PR + 워크북 · **과제① 출제** |

## 1. 학습 목표 (측정 가능)
- [ ] IaC와 선언형(Declarative)의 의미를 한 문장으로 설명할 수 있다
- [ ] `init` / `plan` / `apply` / `destroy` 4대 명령의 역할을 구분할 수 있다
- [ ] S3 버킷을 `apply`로 생성하고 `terraform state list`로 확인할 수 있다
- [ ] `destroy`로 리소스를 제거하고 콘솔에서 사라진 것을 확인할 수 있다

## 2. 사전 예습 (필수)
- HashiCorp: [What is Terraform](https://developer.hashicorp.com/terraform/intro) (10분)
- HashiCorp: [AWS Get Started - Build Infrastructure](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build) (15분)
- 예습 체크: "선언형 IaC가 뭔지" / "state 파일이 왜 필요한지" 한 문장으로 말할 수 있다

## 3. 진행 타임박스 (60분)
| 시간 | 구성 | 내용 |
|------|------|------|
| 0~10분 | 회고 대체 OT 마무리 | 지난 OT 요약, 오늘 목표 |
| 10~20분 | 강의 | IaC 개념, Terraform 동작 원리, 4대 명령 |
| 20~55분 | 실습 45분 | Block A(10) 워크스루 → Block B(25) 각자 apply → Block C(10) destroy 확인 |
| 55~60분 | 마무리 | 과제① 브리핑, 2주차 예고 |

## 4. 실습 개요 — 첫 S3 버킷
오늘 만들 것: **S3 버킷 1개** (+ public access block + versioning). 비용 위험 거의 없음(빈 버킷은 사실상 $0).

```bash
cd practice
terraform init      # provider 다운로드
terraform plan      # "1 to add" 확인
terraform apply     # yes -> 버킷 생성
terraform state list        # aws_s3_bucket.lab 등 확인
terraform destroy   # yes -> 버킷 제거
```

- `practice/`의 `# TODO` 를 채우며 진행합니다. 막히면 `solution/`을 참고 (스터디 후 공개 권장).
- 버킷 이름은 **글로벌 유니크**해야 하므로 `terraform.tfvars`의 `project_name`에 본인 이름/학번을 넣으세요.

## 5. 체크포인트 (Definition of Done)
- [ ] `terraform apply` 성공, `state list`에 버킷 존재
- [ ] AWS 콘솔(서울 리전 아님 — S3는 글로벌 목록)에서 버킷 확인
- [ ] **`terraform destroy` 완료 & 콘솔에서 버킷 사라짐 확인**
- [ ] `git diff`로 `*.tfvars` / `*.tfstate` 안 올라갔는지 확인

## 6. 트러블슈팅 FAQ
| 증상 | 원인 | 해결 |
|------|------|------|
| `BucketAlreadyExists` | 버킷명 전역 중복 | `project_name`에 고유 suffix(이름/학번) |
| `NoCredentialProviders` | 자격증명 미설정 | `aws configure` 후 `aws sts get-caller-identity` 확인 |
| `AccessDenied` | IAM 권한 부족 | 실습용 사용자에 권한 확인 (SETUP 참고) |
| destroy 실패 (BucketNotEmpty) | 버킷에 객체 있음 | `force_destroy = true` 이해 (심화) |

## 7. 심화 도전과제 (Optional ⭐)
- L2: 버킷 이름을 변수로 받고, `tags`에 공통 태그를 추가해보기
- L3-⭐: `aws_s3_bucket_versioning`을 켜고, `lifecycle` 규칙으로 30일 후 만료 설정 추가

## 8. 다음 주 예고 & 준비물
- Week2: 리소스 문법 & State — VPC/EC2 배포로 종속성과 tfstate 구조 이해
- 예습: `resource` 블록 참조로 만들어지는 의존성, `data source`, VPC/Subnet/EC2 기본 문법

---
> **공통 규칙**: 자격증명/secret 커밋 금지 · 실습 종료 = `destroy` 완료 확인 · 코드는 PR로
