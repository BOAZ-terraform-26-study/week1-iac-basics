# submissions

Week1 실습 제출 폴더입니다. **본인 GitHub ID로 폴더를 만들어** 제출하세요.

```
submissions/
├── kdh1834/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── providers.tf
│   ├── versions.tf
│   ├── example.tfvars
│   └── .terraform.lock.hcl
└── {your-github-id}/
    └── ...
```

## 규칙

- 폴더 이름은 **본인 GitHub ID**. 사람마다 폴더가 달라서 PR이 충돌하지 않고 전부 머지됩니다.
- **`practice/`는 건드리지 마세요.** 거기는 다음 사람이 풀 `# TODO` 스켈레톤입니다.
- `terraform.tfvars`와 `terraform.tfstate`는 **절대 커밋 금지**입니다. `.gitignore`가 막고 있지만, 푸시 전에 `git status`로 한 번 더 확인하세요.

자세한 절차는 [루트 README §5](../README.md).
