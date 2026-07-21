variable "region" {
  description = "AWS 리전 (스터디 공통: 서울)"
  type        = string
  default     = "ap-northeast-2"
}

variable "project_name" {
  description = "리소스 접두어 (S3 버킷명 글로벌 유니크용, 본인 이름/학번 포함)"
  type        = string
  # 예: "boaz-tf-subin"
}
