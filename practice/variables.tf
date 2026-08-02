variable "region" {
  description = "AWS 리전 (스터디 공통: 서울)"
  type        = string
  default     = "ap-northeast-2"
}

variable "project_name" {
  description = "리소스 접두어. 본인 GitHub ID 사용. 최종 버킷명 뒤에 계정번호가 붙어 전역 유니크해짐 (40자 이내 권장)"
  type        = string
  # 예: "boaz-tf-subin"
}
