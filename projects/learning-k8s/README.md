# learning-k8s

```
cd /mnt/tf-container/projects/learning-k8s

# Generate ssh keypair for ec2 instance (with empty passphrase)
$ ssh-keygen -t rsa -b 2048 -f ./credential/learning-k8s-keypair
$ mv ./credential/learning-k8s-keypair ./credential/learning-k8s-keypair.pem

$ terraform init
```