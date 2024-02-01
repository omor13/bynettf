output "Server_ip" {
    value = aws_instance.testserver.private_ip
}

output "Server_state" {
    value = aws_instance.testserver.instance_state
}