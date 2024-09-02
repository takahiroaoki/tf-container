#/bin/bash

ssh-keygen -t rsa -b 2048 -f ./credential/minikube-aws-keypair -q -N ''
mv -f ./credential/minikube-aws-keypair ./credential/minikube-aws-keypair.pem