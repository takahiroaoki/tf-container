# minikube-aws

This is tf files of ec2 instance for the [minikube-aws](https://github.com/takahiroaoki/minikube-aws) project.

Minikube need 2CPUs, so the instance type is larger than t2.medium.

```
cd /mnt/tf-container/projects/minikube-aws

# Generate ssh keypair for ec2 instance (with empty passphrase)
$ ssh-keygen -t rsa -b 2048 -f ./credential/minikube-aws-keypair
$ mv ./credential/minikube-aws-keypair ./credential/minikube-aws-keypair.pem

$ terraform init
```