# Title
[Run a Serverless "Hello, World!" with AWS Lambda](https://aws.amazon.com/tutorials/run-serverless-code/)

# Design

# Cost

# Key Takeaways
### Commands to create groups, policies and roles
```
# Step 1: Create group and assign read permissions
aws iam create-group --group-name dev_group
aws iam create-policy --policy-name ReadLambdaS3DynamoDB --policy-document file://read_policy.json
aws iam attach-group-policy --group-name dev_group --policy-arn arn:aws:iam::<YOUR_ACCOUNT_ID>:policy/ReadLambdaS3DynamoDB
aws iam add-user-to-group --group-name dev_group --user-name dev_user

# Step 2: Create role for full Lambda access
aws iam create-role --role-name FullAccessLambdaRole --assume-role-policy-document file://trust_policy.json
aws iam attach-role-policy --role-name FullAccessLambdaRole --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess
aws iam update-role --role-name FullAccessLambdaRole --max-session-duration 43200

# Step 3: Inform dev_user of role ARN and CLI command to assume role
aws sts assume-role --role-arn arn:aws:iam::<YOUR_ACCOUNT_ID>:role/FullAccessLambdaRole --role-session-name LambdaFullAccessSession
```