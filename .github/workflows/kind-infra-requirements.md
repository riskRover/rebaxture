# Requirements 
- Terraform:
    Install and configure Terraform on the GitHub Actions runner.
- AWS Credentials:
    Use AWS credentials securely via GitHub secrets to authenticate Terraform with AWS.
- GitHub Secrets:
    Store sensitive information like AWS Access Key, Secret Key, and the SSH private key for remote-exec in GitHub secrets.
- Running Terraform:
    Initialize Terraform.
    Validate and apply the Terraform configuration.
    Clean up and destroy the infrastructure if needed.
- Outputs:
    Display outputs (like the generated kind-config.yaml or EC2 IPs).

## Steps:
Store following AWS Credentials and SSH Private Key in GitHub Secrets:
  
- AWS_ACCESS_KEY_ID - Your AWS Access Key.
-	AWS_SECRET_ACCESS_KEY - Your AWS Secret Key.
-	AWS_REGION - The AWS region where you want to provision the resources.
-	SSH_PRIVATE_KEY - The content of your SSH private key used for the remote-exec connection.
