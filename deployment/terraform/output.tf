output "curl" {
    value = "curl -XGET ${aws_api_gateway_stage.example.invoke_url}/${aws_api_gateway_resource.resource.path_part}"
}
