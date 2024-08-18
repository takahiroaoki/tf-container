# tf-container
Terraform execution environment.

## Requirement
- DockerDesktop

We use GitHub Codespaces.

## Setup
We have to create an IAM user "terraform" profile with appropriate access.

After creating IAM user via aws management console, execute the following command.

```
# Initial setting for awscli. Input your key info.
$ aws configure --profile terraform

# You can check the credential.
$ cat ~/.aws/credentials

# The result of the command above is like following.
> [terraform]
> aws_access_key_id = ${Your access key}
> aws_secret_access_key = ${Your secret key}
```

## How to use
```
$ cd projects/${Your projects}
$ terraform init
```
Then you can use terraform commands.

## Appendix
```
# Apply terraform file.
$ terraform apply

# Destroy resources.
$ terraform destroy

# Format tf files
$ terraform fmt
```
