# ruby-slack-aws-ec2-instances-running
Very simple Ruby script to play around with the aws-sdk

Posts to Slack the currently active AWS EC2 instances in all regions.

Lambda function included

```
$ aws lambda update-function-code --function-name ec2-instances-running --zip-file fileb://ec2slack.zip
```

### Requirements

- Configured Slack Bot and its API Token
- environment variable SLACK_API_TOKEN set to Bot API Token ```export SLACK_API_TOKEN=yourapitokenhere```
- Change *channel* to your prefered Slack Channel (defaults to **#general** )


