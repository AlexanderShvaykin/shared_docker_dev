FROM erlang:19.3.6.13
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y git make

# Set working directory
WORKDIR /webapps

# Clone tb-presence repository
RUN git clone -b influxdb_1 --recursive https://github.com/teachbase/tb-presence.git

# Copy config files
COPY app.config.sample tb-presence/files/app.config
COPY vm.args.sample tb-presence/files/vm.args

# Compile & release tb-presence
RUN cd tb-presence && \
  make all && \
  ./rebar3 as prod release -o /webapps/releases

# Run app
CMD /webapps/releases/tb-presence/bin/tb-presence foreground

# Expose relevant ports
EXPOSE 8081
