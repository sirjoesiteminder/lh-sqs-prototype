provider "aws" {
  region = "us-west-2"
}

resource "aws_sqs_queue" "inventory_qeueue" {
  name                        = "lh-inventory"
  visibility_timeout_seconds  = 30
  max_message_size            = 2048
  message_retention_seconds   = 172800
  receive_wait_time_seconds   = 10

  redrive_policy = <<EOF
{
    "maxReceiveCount": 3,
    "deadLetterTargetArn": "${aws_sqs_queue.inventory_dead_letter_queue.arn}"
}
EOF
}

resource "aws_sqs_queue" "inventory_dead_letter_queue" {
  name                        = "lh-inventory-dead-letter"
  visibility_timeout_seconds  = 30
  max_message_size            = 2048
  message_retention_seconds   = 864000
  receive_wait_time_seconds   = 20
}

resource "aws_sqs_queue" "report_qeueue" {
  name                        = "lh-report"
  visibility_timeout_seconds  = 30
  max_message_size            = 2048
  message_retention_seconds   = 172800
  receive_wait_time_seconds   = 10

  redrive_policy = <<EOF
{
    "maxReceiveCount": 3,
    "deadLetterTargetArn": "${aws_sqs_queue.report_dead_letter_queue.arn}"
}
EOF
}

resource "aws_sqs_queue" "report_dead_letter_queue" {
  name                        = "lh-report-dead-letter"
  visibility_timeout_seconds  = 30
  max_message_size            = 2048
  message_retention_seconds   = 864000
  receive_wait_time_seconds   = 20
}