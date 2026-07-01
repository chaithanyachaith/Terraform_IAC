resource "aws_cloudwatch_dashboard" "this" {

  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({

    widgets = [
      {
        "type"   = "metric"
        "x"      = 0
        "y"      = 0
        "width"  = 12
        "height" = 6

        "properties" = {
          "title"  = "EC2 CPU Utilization"
          "view"   = "timeSeries"
          "region" = "ap-south-1"
          "stat"   = "Average"
          "period" = 300

          "metrics" = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              var.auto_scaling_group_name
            ]
          ]
        }
      }
    ]

  })

}