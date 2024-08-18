# tf-container

## Requirement
- DockerDesktop

We use GitHub Codespaces.

## Setup
We have to create an IAM user profile with appropriate access.

After creating IAM user via aws management console, execute the following command.

```
# Initial setting for awscli. Input your key info.
$ aws configure --profile ${USER}

# You can check the credential.
$ cat ~/.aws/credentials

# The result of the command above is like following.
> [${USER}]
> aws_access_key_id = ${Your access key}
> aws_secret_access_key = ${Your secret key}
```

## Appendix
```
# Apply terraform file.
$ terraform apply

# Destroy resources.
$ terraform destroy
```