#!/bin/bash

echo "
#!/bin/bash
export DB_HOST=${db_host}
export DB_PORT=${db_port}
export DB_DATABASE=${db_database}
export DB_USER=${db_user}
export DB_PASSWORD=${db_password}
" > /home/ec2-user/export.sh

systemctl enable grpc-sample
systemctl start grpc-sample