# ec2

Make one ec2 instance

```
cd /mnt/tf-container/projects/ec2

# Generate ssh keypair for ec2 instance (with empty passphrase)
$ ssh-keygen -t rsa -b 2048 -f ./credential/ec2-keypair
$ mv ./credential/ec2-keypair ./credential/ec2-keypair.pem

$ terraform init
```