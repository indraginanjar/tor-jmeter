# indraginanjar/tor-jmeter
FROM lazzurs/jmeter:5.2

USER root
EXPOSE 9050
RUN /bin/sh -c set -eux;apt-get update;apt-get install -y --no-install-recommends apt-utils;
RUN /bin/sh -c set -eux;apt-get install -y --no-install-recommends tor torsocks polipo;rm -rf /var/lib/apt/lists/*;
RUN touch /etc/tor/torr
RUN echo "127.0.0.1 JMETER-MACHINE" >> /etc/hosts
ENV log4j.hostName=localhost
COPY . /home/jmeter/apache-jmeter-5.2
RUN chmod +x /home/jmeter/apache-jmeter-5.2/container-init.sh
RUN chown jmeter /home/jmeter/apache-jmeter-5.2/container-init.sh
USER jmeter
COPY . /home/jmeter/apache-jmeter-5.2
ENTRYPOINT ["/home/jmeter/apache-jmeter-5.2/container-init.sh"]