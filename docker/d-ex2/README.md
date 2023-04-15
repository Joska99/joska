<p align="center">
  <img src="https://github.com/Joska99/joska/blob/main/docker/d-ex2/diagram.drawio.svg">
</p>

sudo service docker start
docker build -t my-nx:1 .
docker run -p 8000:80 -d -t my-nx:4
localhost:8000 -> index.html, also can add "about.html" -> localhost:8000/aboutt.html etc.