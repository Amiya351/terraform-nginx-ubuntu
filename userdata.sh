#!/bin/bash

apt update -y

apt install nginx -y

systemctl enable nginx
systemctl start nginx

cat <<EOF > /var/www/html/index.html

<!DOCTYPE html>
<html>
<head>
<title>Terraform Nginx</title>
</head>
<body>
<h1>Welcome to the Terraform-managed Nginx Server on Ubuntu</h1>
</body>
</html>

EOF