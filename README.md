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
Reference to each project's README @projects/${each project}

## Appendix
### Terraform
```
# Apply terraform file.
$ terraform apply

# Apply terraform file with no checks
$ terraform apply -auto-approve

# Destroy resources.
$ terraform destroy

# Format tf files
$ terraform fmt

# List resources managed by terraform
$ terraform state list

# Show detailed state
$ terraform state show ${resource}

# Update resource name
$ terraform mv ${resource} ${destination}

# Exclude resource out of terraform management
$ terraform state rm ${resource}

# Reflect the current state to tfstate
$ terraform refresh

# Output dependency graph for Graphviz
$ terraform graph > ${filename}
```
### Others
```
# Generate key pair
$ ssh-keygen [-t ${type}][-b ${bits}][-f ${filename}]
```