 jenkins iam role 

 resource "aws_iam_role" "jenkins_irsa_role"{
    name = "${var.environments}-jenkins-irsa-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"

        Statement = [{
            Effect = Allow
            
            Principal = {
                Federated = var.oidc_provider_arn
            }
            Action = "sts:AssumeRoleWithWebIdentity"

            condition = {
                StringEquals = {
                    "${var.oidc_provider_url}:sub"  = "system:serviceaccount:jenkins:jenkins"
                }
            }
        }]
    })
 }

 # attach the policy for jenkins service account to integrate with aws resoucrces

 resource "aws_iam_role_policy_attachment" "jenkins_ec2" {
  role       = aws_iam_role.jenkins_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "jenkins_sns" {
  role       = aws_iam_role.jenkins_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}

resource "aws_iam_role_policy_attachment" "jenkins_s3" {
  role       = aws_iam_role.jenkins_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "jenkins_dynamodb" {
  role       = aws_iam_role.jenkins_irsa_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}