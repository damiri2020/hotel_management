#!/bin/bash

# Update package listttt   
sudo apt update

# Install Python dependencies
sudo apt install -y python3-pip python3-dev python3-venv python3-wheel

# Install PostgreSQL
sudo apt install -y postgresql postgresql-client

# Install system dependencies for Odoo
sudo apt install -y build-essential wget git bzr python3-setuptools \
    libxslt1-dev libjpeg-dev libzip-dev libldap2-dev libsasl2-dev \
    python3-tk libpq-dev node-less libjpeg8-dev liblcms2-dev \
    libfreetype6-dev zlib1g-dev libxml2-dev libxslt1-dev \
    libffi-dev libssl-dev

# Create Python virtual environment
python3 -m venv ~/odoo-venv

# Activate virtual environment and install Python packages
source ~/odoo-venv/bin/activate
pip install wheel
pip install -r https://raw.githubusercontent.com/odoo/odoo/16.0/requirements.txt

# Setup PostgreSQL
sudo -u postgres createuser --createdb $(whoami)

# Print success message
echo "WSL environment setup completed successfully!"
echo "To activate the virtual environment, run: source ~/odoo-venv/bin/activate"
