#! /usr/bin/env bash

# Unset AWS STS session environment variables
function drop_aws_sts_session {
  unset AWS_ACCESS_KEY_ID
  unset AWS_DEFAULT_REGION
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}

# Export AWS STS session environment variables
function export_aws_sts_session {
  drop_aws_sts_session
  session="$(aws sts get-session-token --output=json)"
  AWS_ACCESS_KEY_ID="$(echo $session | jq -r .Credentials.AccessKeyId)"
  AWS_DEFAULT_REGION="$1"
  AWS_SECRET_ACCESS_KEY="$(echo $session | jq -r .Credentials.SecretAccessKey)"
  AWS_SESSION_TOKEN="$(echo $session | jq -r .Credentials.SessionToken)"
  export AWS_ACCESS_KEY_ID
  export AWS_DEFAULT_REGION
  export AWS_SECRET_ACCESS_KEY
  export AWS_SESSION_TOKEN
}

export_aws_sts_session "us-east-1"

# Destroy any existing Terraform state in us-east-1
bundle exec kitchen destroy


export_aws_sts_session "us-west-2"

# # Destroy any existing Terraform state in us-west-2
bundle exec kitchen destroy

drop_aws_sts_session