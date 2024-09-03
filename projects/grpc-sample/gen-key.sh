#/bin/bash

ssh-keygen -t rsa -b 2048 -f ./credential/grpc-sample-keypair -q -N ''
mv -f ./credential/grpc-sample-keypair ./credential/grpc-sample-keypair.pem
chmod 0400 ./credential/grpc-sample-keypair.pem