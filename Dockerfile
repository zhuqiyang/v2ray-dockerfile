FROM centos:centos7

RUN  curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo && yum install privoxy supervisor net-tools -y
COPY config /etc/privoxy/
COPY v2ray-linux-64.zip /tmp/v2ray/
COPY install-release.sh /root/
RUN bash -x /root/install-release.sh
COPY config.json /usr/local/etc/v2ray/
COPY run.sh /root/

CMD ["sh","/root/run.sh"]
