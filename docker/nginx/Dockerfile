#import image:version to build on it
FROM nginx
#copy from (path) to (container-path)
COPY src/html/index.html /usr/share/nginx/html

RUN ls /usr/share/nginx/html
#run after docker run
CMD [ "nginx", "-g", "daemon off" ]