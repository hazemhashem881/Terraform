output ec2_public_ip{
    value = aws_instance.pubEC2.public_ip
}