 Calenda container, enter year and month it will show you full month
 
 1. "sudo service docker start" -> to start Doocker
 2. In terminal navigate to docker/d-ex1 directory "cd docker/d-ex1"
 And run "docker build -t calenda:1 ."
 3. "docker run -t calenda:1 -it" to run container image
 4. "docker ps -a" -> to check status is exites
 5. "docker rmi -f image id or Name" -> to delete image
 6. "docker container prune" -> to remove all exited containers