sudo service docker start
docker build -t my-nx:1 .
docker run -p 8000:80 -d -t my-nx:4
localhost:8000 -> index.html, also can add "about.html" -> localhost:8000/aboutt.html etc.