### Building
```
docker build -t <container-name> -f <path/to/Dockerfile> .
docker build -t frontend -f .\infrastructure\Frontend.Dockerfile .
```

### Running
```
docker run -p <port-out>:<port-in> -d <container-name>
docker run -p 5443:5443 -d frontend
```