resource "aws_secretsmanager_secret" "secrtmanager" {
  name = "secrtmanager"
  recovery_window_in_days = 0
}


resource "aws_secretsmanager_secret_version" "secmanver" {
  secret_id     = aws_secretsmanager_secret.secrtmanager.id
  secret_string = "superSecret-string-to-protect"
}