FROM java:openjdk-8-jre
MAINTAINER mallikarjunarao <techking1983@gmail.com>
RUN apt-get update && apt-get install -qy apt-transport-https
RUN echo "https://sourceforge.net/projects/sonar-pkg/files/deb/binary/sonar_6.7.1_all.deb/download" >> /etc/apt/sources.list
RUN apt-get update && apt-get clean ### Sonar version 5.6 - timestamp
RUN apt-get install -y --force-yes sonar=5.6
COPY assets/init /app/init
RUN chmod 755 /app/init
VOLUME /opt/sonar/extensions
VOLUME /opt/sonar/logs/
ENTRYPOINT ["/app/init"]
CMD ["app:start"]
# Install maven
RUN \
    apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*