output "web_server_public_ip" {

  description = "Public IP address of the web server"

  value = aws_instance.web_server.public_ip

}


output "website_url" {

  description = "URL to access the website"

  value = "http://${aws_instance.web_server.public_ip}"

}