resource "aws_ecr_repository" "backend-foo" {
  name                 = "backend-foo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "frontend-foo" {
  name                 = "frontend-foo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}