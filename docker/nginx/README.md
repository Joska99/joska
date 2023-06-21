<p align="center">
<h1>Docker Container with HTML pages</h1>
<img src="https://github.com/Joska99/joska/blob/main/docker/nginx/diagram.drawio.svg">
</p>

<h1>Steps:</h1>

1. Build Docker image:
```bash
docker build -t my-nginx .
```
2. Run Docker container:

- -p - run on port
- -d - detach mode
- --name - chose container name
- -t - image tag to run
- --rm - remove after execution

```Bash
docker run --name nginx --rm -p 7070:80 -d -t my-nginx 
```
3. Open your browser and navigate to -> localhost:7070
4. Click on a 'about' button to navigate to -> localhost:7070/about.html

<h1> To Tag and Push image to DockerHub</h1>

- Tag Docker image
```bash
docker tag my-nginx joska99/labs-images:my-nginx
```

- Push Docker image
```bash
docker push joska99/labs-images:my-nginx
```
<h1> To Delete</h1>

```bash
docker kill nginx
```