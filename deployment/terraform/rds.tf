module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  create_db_instance = true
  create_db_option_group = false
  create_db_parameter_group = false
  create_db_subnet_group = true
  create_monitoring_role = false

  identifier = "db"

  engine            = "postgres"
  engine_version    = "11.10"
  family            = "postgres11"
  major_engine_version = "11"
  instance_class    = "db.t2.micro"
  allocated_storage = 20

  name     = "lab"
  username = "postgres"
  create_random_password = true
  random_password_length = 16
  port     = "5432"

  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  backup_retention_period = 0
  subnet_ids = module.vpc.private_subnets

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]
}
