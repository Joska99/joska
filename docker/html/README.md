<p align="center">
<h1>Docker Container with HTML pages</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/html/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. navigate to 'd-ex2' dir and run those commands:
```bash
sudo service docker start 
docker build -t my-nx .
docker run --name html -p 8000:80 -d -t my-nx 
```
2. Open your browser and navigate to: localhost:8000
3. Click on a 'about' button to navigate to: localhost:8000/about.html
4. To delete:
```Bash
docker kill html
docker rm html
```