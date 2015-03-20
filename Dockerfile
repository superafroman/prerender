
FROM dockerfile/ubuntu

ENV PHANTOM_CLUSTER_NUM_WORKERS 4
ENV PHANTOM_WORKER_ITERATIONS 10
ENV PHANTOM_CLUSTER_BASE_PORT 123

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs build-essential

RUN npm install npm@next

# Prep for install of phantomjs via npm
RUN apt-get install -y python libfreetype6 libfontconfig

# Copy app files
RUN mkdir -p /var/www/prerender
ADD . /var/www/prerender/.

WORKDIR /var/www/prerender

RUN npm install

EXPOSE 3000

CMD [ "/usr/bin/node", "server.js" ]
