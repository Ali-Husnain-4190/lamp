#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd php php-mysqli mariadb105
sudo systemctl start httpd
sudo systemctl enable httpd

# Create an index.php file
cat <<EOF > /var/www/html/index.php
<?php
\$rds_host = "mysql -h education.c5zswvkq2trd.us-east-1.rds.amazonaws.com -P 3306 -u adminadmin -p";
\$rds_user = "adminadmin";
\$rds_password = "adminadmin";
\$rds_db = "php";

// Create a connection
\$conn = mysqli_connect(\$rds_host, \$rds_user, \$rds_password, \$rds_db);

// Check the connection
if (!\$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected to MySQL database on RDS successfully.";

// Perform database operations here...

// Close the connection
mysqli_close(\$conn);
?>
EOF