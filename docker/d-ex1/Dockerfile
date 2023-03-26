#import image:version to build on it
FROM python:alpine 
#create working directory
WORKDIR /app
#copy from (path) to (container-path)
COPY . .
#run after docker build comand
RUN cat /app/main.py 
#run after docker run
CMD [ "python", "main.py" ]
