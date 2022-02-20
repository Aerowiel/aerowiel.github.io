FROM node:14.17

COPY ./ssh-agent-entrypoint.sh /
RUN chmod +x /ssh-agent-entrypoint.sh

WORKDIR /project
VOLUME ["/project"]

ENTRYPOINT ["npm"]
