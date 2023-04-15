<p align="center">
  <img src="https://github.com/Joska99/joska/blob/main/docker/d-ex2/diagram.drawio.svg">
</p>
steps:<br />
"navigate to d-ex2 folder"<br />
sudo service docker start - to start docker service<br />
docker build -t my-nx:1 . - to build doker image<br />
docker run -p 8000:80 -d -t my-nx:1 - to run image<br />
localhost:8000 -> link button to -> localhost:8000/aboutt.html etc.<br />