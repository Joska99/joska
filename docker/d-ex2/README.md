<p align="center">
  <img src="https://github.com/Joska99/joska/blob/main/docker/d-ex2/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. navigate to d-ex2 folder and run those commands:
```bash
sudo service docker start - to start docker service
docker build -t my-nx:1 . - to build doker image
docker run -p 8000:80 -d -t my-nx:1 - to run image
```
2. Open your browser and navigate to: localhost:8000
3. Click on a 'about' button to navigate to: localhost:8000/about.html