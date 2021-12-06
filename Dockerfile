# indraginanjar/tor-jmeter:5.2-root
FROM lazzurs/jmeter:5.2

USER root
EXPOSE 9050
RUN /bin/sh -c set -eux;apt-get update;apt-get install -y --no-install-recommends apt-utils;
RUN /bin/sh -c set -eux;apt-get install -y --no-install-recommends tor torsocks polipo;rm -rf /var/lib/apt/lists/*;
RUN touch /etc/tor/torr
RUN echo "127.0.0.1 JMETER-MACHINE" >> /etc/hosts
ENV log4j.hostName=localhost
COPY . /
RUN chmod +x /container-init.sh
RUN touch /var/log/polipo/polipo.log

# Fix > WARNING: org.xerial's sqlite-jdbc is not loaded. Please provide the jar on your classpath to parse sqlite files.
RUN mv /lib/tika-parser-sqlite3-package-2.1.0.jar /home/jmeter/apache-jmeter-5.2/lib

# Fix for Error: Missing argument to option -q while executing container-init.sh as entrypoint
ENTRYPOINT [""]
CMD ["/container-init.sh"]