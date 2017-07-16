#
# Super simple example of a Dockerfile
#
FROM node
MAINTAINER Micalgenus "micalgenus@gmail.com"

RUN useradd meteor
RUN mkdir -p /home/meteor

RUN chown meteor:meteor /home/meteor

USER meteor
RUN curl https://install.meteor.com/ | sh

USER root
WORKDIR /usr/share

COPY scripts/package.sh /package.sh
RUN chmod +x /package.sh

ENV MONGO_HOST=localhost
ENV MONGO_PORT=27017
ENV MONGO_DB=

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["su", "meteor", "-c", "cd /usr/share/meteor && npm i && npm start"]

EXPOSE 3000
