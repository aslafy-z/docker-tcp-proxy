FROM haproxy

# Define default variables
ENV BACKEND_HOST=
ENV BACKEND_PORT=

# Allow haproxy to bind <1024 ports
USER root
RUN apt-get update
RUN apt-get install libcap2-bin -y
RUN setcap 'cap_net_bind_service=+ep' /usr/local/sbin/haproxy

USER haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
