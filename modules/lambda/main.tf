module "label" {
  source = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
}

module "label_get_all_authors" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-authors"
}
# module "label_get_all_course" {
#   source   = "cloudposse/label/null"
#   version = "0.25.0"
#   context = module.label.context
#   name = "get-all-course"
# }
module "label_delete_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete-item-author"
}
module "label_create_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "create-item-author"
}
module "label_update_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update-item-author"
}
module "label_get_item" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-item-author"
}
module "label_get_all_courses" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "get-all-courses"
}

module "label_get_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "get-course"
}

module "label_save_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "save-course"
}

module "label_update_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "update-course"
}

module "label_delete_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "delete-course"
}




module "lambda_get_all_authors" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_authors.id
  description   = "Get all authors"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false
  lambda_role   = "arn:aws:iam::992382482319:role/dev-kuryshchuktf-kuryshchuk-get-all-authors"

  source_path = "${path.module}/src/get_all_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  # allowed_triggers = {
  #   ApiGateAny = {
  #     service = "apigateway"
  #     source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
  #   }
  # }

  tags = module.label_get_all_authors.tags
}

module "lambda_get_all_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_courses.id
  description   = "Get all courses"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false
  lambda_role   = "arn:aws:iam::992382482319:role/dev-kuryshchuktf-kuryshchuk-get-all-courses"

  source_path = "${path.module}/src/get_all_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  # allowed_triggers = {
  #   ApiGateAny = {
  #     service = "apigateway"
  #     source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
  #   }
  # }

  tags = module.label_get_all_courses.tags
}

module "lambda_function_delete" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_delete_item.id
  description   = "My delete lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/delete_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_delete_item.tags
}
module "lambda_function_create" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_create_item.id
  description   = "My create lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/create_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_create_item.tags
}
module "lambda_function_update" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_update_item.id
  description   = "My update lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/update_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_update_item.tags
}
module "lambda_function_get" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_item.id
  description   = "Get item lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_item_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_get_item.tags
}

module "lambda_get_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_get_course.id
  description   = "Get course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_get_course_arn

  source_path = "${path.module}/src/get_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  tags = module.label_get_course.tags
}

module "lambda_save_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_save_course.id
  description   = "Save course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_save_course_arn

  source_path = "${path.module}/src/save_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  tags = module.label_update_course.tags
}

module "lambda_update_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_update_course.id
  description   = "Update course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_update_course_arn

  source_path = "${path.module}/src/update_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  tags = module.label_update_course.tags
}

module "lambda_delete_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_delete_course.id
  description   = "Delete course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_delete_course_arn

  source_path = "${path.module}/src/delete_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  tags = module.label_delete_course.tags
}