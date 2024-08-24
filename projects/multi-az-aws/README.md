# multi-az-aws
Basic multi-az composition on AWS.

```
# Generate ssh keypair for ec2 instance (with empty passphrase)
$ ssh-keygen -t rsa -b 2048 -f ./src/multi-az-aws-dev-keypair
$ mv ./src/multi-az-aws-dev-keypair ./src/multi-az-aws-dev-keypair.pem

$ terraform init
```