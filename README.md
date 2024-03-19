# NBS-logstash

### Build Image
docker build -t nbs-logstash .

### Run container
docker-compose up

### Test
curl -X PUT 'http://192.168.1.6:8080' -d  '{"amount":100, "name":"product x"}