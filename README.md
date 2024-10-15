# Setup GeoServer on EC2
Scripts for setting up a geoserver instance on aws ec2 ubuntu


## Setting up GeoServer
Copy install_docker.sh to EC2
```
scp -i ./key.pem install_docker.sh ubuntu@ec2-public-ip:/home/ubuntu
```
Connect to EC2 Instance via Shell or AWS Instance Connect and excute script
```
ssh -i ./key.pem ubuntu@ec2-public-ip
cd /home/ubuntu
./install_docker.sh
```

run geoserver container with mounted volume and no demo data
```
docker pull docker.osgeo.org/geoserver:2.26.0

docker run -d -it -p 8080:8080 \
  --env SKIP_DEMO_DATA=true --env GEOSERVER_ADMIN_USER=admin --env GEOSERVER_ADMIN_PASSWORD=geoserver \
  -v /home/geoserver_data:/var/geoserver_data \
  docker.osgeo.org/geoserver:2.26.0

```
