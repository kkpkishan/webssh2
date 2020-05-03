FROM node:8.6
MAINTAINER Khatrani Kishan  <support17@electromech.info> 
RUN apt-get update 
RUN apt-get install  nginx -y
RUN apt-get install supervisor -y 
RUN apt-get install net-tools -y 
COPY ./supervisord.conf /etc/supervisor.conf 
COPY ./web-ssh.conf /etc/nginx/conf.d/web-ssh.conf
WORKDIR /usr/src
COPY app/ /usr/src/
RUN npm install --production
EXPOSE 80
#ENTRYPOINT [ "/usr/local/bin/node", "index.js" ]
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
