provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_s3_bucket" "website" {
  bucket = "your-unique-bucket-name"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  acl    = "public-read"

  source = "path/to/your/index.html"  # Replace with the actual path to your HTML file
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.website.bucket
  key    = "error.html"
  acl    = "public-read"

  source = "path/to/your/error.html"  # Replace with the actual path to your HTML file
}

resource "aws_dynamodb_table" "visitor_counter" {
  name           = "visitor_counter"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "page"
  attribute {
    name = "page"
    type = "S"
  }
  attribute {
    name = "visits"
    type = "N"
  }
}

resource "aws_lambda_function" "visitor_counter_lambda" {
  filename      = "visitor_counter_lambda.zip"  # Create a zip file containing your Lambda function code
  function_name = "visitor_counter_lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda.handler"
  runtime       = "nodejs14.x"

  environment = {
    DYNAMODB_TABLE = aws_dynamodb_table.visitor_counter.name
  }
}

resource "aws_api_gateway_rest_api" "visitor_counter_api" {
  name        = "visitor_counter_api"
  description = "API for Visitor Counter Lambda"
}

resource "aws_api_gateway_resource" "visitor_counter_resource" {
  rest_api_id = aws_api_gateway_rest_api.visitor_counter_api.id
  parent_id   = aws_api_gateway_rest_api.visitor_counter_api.root_resource_id
  path_part   = "visitor-count"
}

resource "aws_api_gateway_method" "visitor_counter_method" {
  rest_api_id   = aws_api_gateway_rest_api.visitor_counter_api.id
  resource_id   = aws_api_gateway_resource.visitor_counter_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "visitor_counter_integration" {
  rest_api_id             = aws_api_gateway_rest_api.visitor_counter_api.id
  resource_id             = aws_api_gateway_resource.visitor_counter_resource.id
  http_method             = aws_api_gateway_method.visitor_counter_method.http_method
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.visitor_counter_lambda.invoke_arn
}

resource "aws_lambda_permission" "visitor_counter_lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.visitor_counter_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.visitor_counter_api.execution_arn}/*/${aws_api_gateway_method.visitor_counter_method.http_method}/visitor-count"
}

output "api_gateway_url" {
  value = aws_api_gateway_rest_api.visitor_counter_api.invoke_url
}
