terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = ">= 3.63.0"
    datadog = {
      source = "DataDog/datadog"
    }
  }
}