#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx