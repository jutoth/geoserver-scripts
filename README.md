# GeoServer-Scripts
Scripts for setting up and modifying geoserver instance on aws ec2 ubuntu


## Setting up GeoServer
Copy setup_geoserver.sh to EC2
    scp -i ~/my-ec2-key.pem install_geoserver.sh ubuntu@54.123.45.67:/home/ubuntu/
Connect to EC2 Instance via Shell or AWS Instance Connect
    ssh -i /path/to/your-key.pem ubuntu@your-ec2-public-ip