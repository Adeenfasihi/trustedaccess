# Creating Database

sudo apt-get install mysql-server 
sudo systemctl start mysql.service

## Terminal 1:
sudo mysql
CREATE DATABASE reboot2024;

CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON trusted_access_bank.* TO 'dev_user'@'localhost';
FLUSH PRIVILEGES;

## Terminal 2:
python run.py

## Terminal 1 (again):
Copy SQL from ``dummy_data.sql`` and paste into mysql.
