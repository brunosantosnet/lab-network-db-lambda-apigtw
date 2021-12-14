module "lambda_function_in_vpc" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda-in-vpc"
  description   = "My awesome lambda function"
  handler       = "app.lambda_handler"
  runtime       = "python3.8"

  source_path = "../../app/app.py"

  vpc_subnet_ids         = module.vpc.private_subnets
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  attach_network_policy = true

  layers = ["arn:aws:lambda:us-east-1:898466741470:layer:psycopg2-py38:2"]

  publish = true

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "arn:aws:execute-api:us-east-1:882456490456:/*/*/*"
    }
  }

  environment_variables = {
    db_instance_address = module.db.db_instance_address
    db_instance_port    = module.db.db_instance_port
    db_instance_username = module.db.db_instance_username
    db_master_password = module.db.db_master_password
  }
}

resource "aws_lambda_permission" "allow_api" {
  statement_id  = "AllowAPIgatewayInvokation"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda_function_in_vpc.lambda_function_name
  principal     = "apigateway.amazonaws.com"
}
