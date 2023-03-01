// TODO Implement. Note your Terraform code must use/be compatible with Terraform version 0.12.25.
// Part 1: Here's an example Terraform configuration for creating a CloudWatch alarm that monitors the CPU utilization of an EC2 instance:
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "example-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"
  alarm_description   = "Alarm when CPU exceeds 90% utilization"
  alarm_actions       = ["${var.sns_topic_arn}"]
  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "sns_topic_arn" {}
variable "instance_id" {}


// Part 2: Here is an example of creating a CloudWatch dashboard using Terraform. Please note that you will need to have the AWS provider configured in your Terraform project before you can use this code.

# Define the AWS provider
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

# Define the CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "example_dashboard" {
  dashboard_name = "example_dashboard"

  # Define the widgets for the dashboard
  dashboard_body = jsonencode([
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${aws_instance.example.id}"
          ]
        ],
        "region": "${var.aws_region}",
        "period": 300,
        "stat": "Average",
        "title": "EC2 CPU Utilization"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 1,
      "properties": {
        "markdown": "# Example Dashboard\n\nThis is an example CloudWatch dashboard created with Terraform."
      }
    }
  ])
}

# Define an EC2 instance to monitor
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  tags = {
    Name = "example-instance"
  }
}


// In this example, we create a CloudWatch dashboard with one widget that displays the CPU utilization of an EC2 instance. We also include a text widget with a brief description of the dashboard.

// var.aws_access_key: Your AWS access key ID
// var.aws_secret_key: Your AWS secret access key
// var.aws_region: The AWS region to create the dashboard in
// var.ami: The ID of the AMI to use for the EC2 instance
// var.instance_type: The type of the EC2 instance to launch
// var.subnet_id: The ID of the subnet to launch the EC2 instance in
// var.key_name: The name of the key pair to use for the EC2 instance



// Part 3: To create a CloudWatch Logs Insights query definition using Terraform, you can use the aws_cloudwatch_query_definition resource. Here's an example code block:

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_cloudwatch_query_definition" "example" {
  name          = "example-query-definition"
  query_string  = "fields @timestamp, @message | sort @timestamp desc | limit 20"
  log_group_arn = "arn:aws:logs:us-west-2:123456789012:log-group:/aws/lambda/example-function:*"
}





// In this example, we are using the aws_cloudwatch_query_definition resource to create a query definition named example-query-definition. The query_string parameter specifies the CloudWatch Logs Insights query to be saved as the definition, and the log_group_arn parameter specifies the ARN of the log group that the query should be applied to.

// Here, we can replace the values in the provider block and the variables with our own AWS access key, secret key, and region. You will also need to replace the log group ARN with the ARN of the log group you want to apply the query to.

