provider "alicloud" {
  region = "cn-beijing"
  version = "=1.118.0"
}

resource "alicloud_ros_template" "example" {
  template_name = "example_value"
  template_body = <<EOF
    {
        "ROSTemplateFormatVersion": "2015-09-01"
    }
    EOF
}

resource "alicloud_ros_stack_group" "example" {
  stack_group_name = "example_value"
  template_body = <<EOF
    {
        "ROSTemplateFormatVersion": "2015-09-01"
    }
    EOF
}

resource "alicloud_ros_stack" "example" {
  stack_name = "tf-testaccstack"
  template_body = <<EOF
    {
        "ROSTemplateFormatVersion": "2015-09-01"
    }
    EOF
  stack_policy_body = <<EOF
    {
        "Statement": [{
            "Action": "Update:Delete",
            "Resource": "*",
            "Effect": "Allow",
            "Principal": "*"
        }]
    }
    EOF
}

resource "alicloud_ros_change_set" "example" {
  change_set_name   = "example_value"
  stack_name        = alicloud_ros_stack.example.stack_name
  change_set_type   = "CREATE"
  description       = "Test From Terraform"
  template_body     = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
}