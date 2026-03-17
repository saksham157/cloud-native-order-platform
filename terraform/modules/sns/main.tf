resource "aws_sns_topic" "infra_notfication"{
    name = "infra_notfication"
    }

resource "aws_sns_topic_subscription" "email" {
    topic_arn = aws_sns_topic.infra_notfication.arn
    protocol = email
    endpoint = var.email
}