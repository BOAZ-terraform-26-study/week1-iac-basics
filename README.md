# Week 1. IaC 개념 & Terraform 기초 `[비대면]`

> 📘 **워크북 2종**: 강의 파트는 개념 워크북, 실습 파트는 실습 워크북을 위에서 아래로 따라갑니다.
> - **[개념 워크북 PDF »](./lecture/개념워크북.pdf)** (10분): IaC·선언형·provider·4대 명령·state
> - **[실습 워크북 PDF »](./lecture/실습워크북.pdf)** (35분): `practice/`에서 apply → state → destroy

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

## 2. 사전 예습 
- HashiCorp: [What is Terraform](https://developer.hashicorp.com/terraform/intro) (10분)
- HashiCorp: [AWS Get Started - Build Infrastructure](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build) (15분)
- 예습 체크: "선언형 IaC가 뭔지" / "state 파일이 왜 필요한지" 한 문장으로 말할 수 있다

## 3. 진행 타임박스 (60분)
| 시간 | 구성 | 내용 |
|------|------|------|
| 0~10분 | OT 마무리 (회고 대체) | 지난 OT 요약, 오늘 목표 |
| 10~20분 | 강의 | IaC 개념, Terraform 동작 원리, 4대 명령 |
| 20~55분 | 실습 35분 | Block A(8) 워크스루 → Block B(20) 각자 apply → Block C(7) destroy 확인 |
| 55~60분 | 마무리 | 과제① 브리핑, 2주차 예고 |

## 4. 실습 개요: 첫 S3 버킷
오늘 만들 것: **S3 버킷 1개** (+ public access block + versioning). 비용 위험 거의 없음(빈 버킷은 사실상 $0).

```bash
cd practice
terraform init      # provider 다운로드
terraform validate  # 문법 검사 (init 이후)
terraform plan      # "1 to add" 확인
terraform apply     # yes -> 버킷 생성
terraform state list        # aws_s3_bucket.lab 등 확인
terraform destroy   # yes -> 버킷 제거
```

- `practice/`의 `# TODO` 를 채우며 진행합니다. 막히면 `solution/`을 참고 (스터디 종료 후 공개 권장).
- 버킷 이름은 **글로벌 유니크**해야 합니다. `data "aws_caller_identity"`로 읽은 **계정번호가 자동으로 뒤에 붙으므로**, `project_name`에는 본인 GitHub ID만 넣으면 됩니다.

## 5. 실습 결과 제출: 브랜치 생성 후 PR

실습이 끝나면 **`submissions/{github-id}/` 본인 폴더**에 올려주세요. 리뷰 후 강사가 머지합니다.

```bash
git switch main && git pull
git switch -c week1/{github-id}                        # 예: week1/kdh1834

mkdir -p submissions/{github-id}
cp practice/*.tf practice/example.tfvars submissions/{github-id}/
cp practice/.terraform.lock.hcl          submissions/{github-id}/

git add submissions/{github-id}
git status                                             # tfvars / tfstate 안 올라갔는지 확인!
git commit -m "week1: {github-id} 실습 제출"
git push -u origin week1/{github-id}
```

그다음 GitHub에서 `week1/{github-id}` → `main` PR을 만들면 됩니다.

> **`practice/`를 직접 고쳐서 올리지 마세요.** 머지하는 순간 다음 사람이 풀 `# TODO` 스켈레톤이 없어집니다. 폴더가 사람마다 달라야 8명 PR을 전부 머지할 수 있습니다.

> **`terraform.tfvars` / `terraform.tfstate`는 절대 커밋 금지.** `.gitignore`로 제외되어 있지만 푸시 전에 `git status`로 한 번 더 확인하세요.

## 6. 체크포인트 (Definition of Done)
- [ ] `terraform apply` 성공, `state list`에 버킷 존재
- [ ] AWS 콘솔(서울 리전이 아니어도 됨: S3 버킷 목록은 리전과 무관하게 전체 표시)에서 버킷 확인
- [ ] **`terraform destroy` 완료 & 콘솔에서 버킷 사라짐 확인**
- [ ] `git status`로 `*.tfvars` / `*.tfstate` 안 올라갔는지 확인

## 7. 트러블슈팅 FAQ
| 증상 | 원인 | 해결 |
|------|------|------|
| `BucketAlreadyExists` | 버킷명 전역 중복 | 계정번호가 자동으로 붙어 거의 안 남. 나면 `project_name` 변경 |
| `NoCredentialProviders` | 자격증명 미설정 | `aws configure` 후 `aws sts get-caller-identity` 확인 |
| `AccessDenied` | IAM 권한 부족 | 실습용 사용자에 권한 확인 (SETUP 참고) |
| destroy 실패 (BucketNotEmpty) | 버킷에 객체 있음 | `force_destroy = true` 이해 (심화) |
| `var.project_name` 입력하라며 멈춤 | `terraform.tfvars` 미생성 | `cp example.tfvars terraform.tfvars` |
| `Inconsistent dependency lock file` | `init` 미실행 | `terraform init` |
| `plan`이 `No changes.` | `main.tf`의 TODO가 아직 주석 상태 | TODO를 채우고 다시 `plan` |

## 8. 심화 도전과제 (Optional ⭐)
- L2: 버킷 이름을 변수로 받고, `tags`에 공통 태그를 추가해보기
- L3-⭐: `aws_s3_bucket_versioning`을 켜고, `lifecycle` 규칙으로 30일 후 만료 설정 추가

## 9. 다음 주 예고 & 준비물
- Week2: 리소스 문법 & State. VPC/EC2 배포로 종속성과 tfstate 구조 이해
- 예습: `resource` 블록 참조로 만들어지는 의존성, `data source`, VPC/Subnet/EC2 기본 문법

---
> **공통 규칙**: 자격증명/secret 커밋 금지 · 실습 종료 = `destroy` 완료 확인 · 코드는 PR로
