FROM ubuntu:22.04
RUN apt-get update -y 
RUN apt-get install software-properties-common curl -y
RUN echo "deb [arch=amd64] http://repo.powerdns.com/ubuntu jammy-auth-47 main" > "/etc/apt/sources.list.d/pdns.list" 
RUN echo "Package: pdns-* \ Pin: origin repo.powerdns.com \ Pin-Priority: 600" > "/etc/apt/preferences.d/pdns" 
RUN curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -
RUN apt-get update -y 
RUN apt-get install pdns-server pdns-backend-mysql -y 
RUN apt autoremove -y 
RUN apt clean -y
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
