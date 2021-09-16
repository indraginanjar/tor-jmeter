#!/bin/sh
tor --runasdaemon 1
sleep 30s
polipo proxyAddress=0.0.0.0 socksParentProxy="127.0.0.1:9050" socksProxyType=socks5 diskCacheRoot="" logLevel=0x0 daemonise=true
sleep 5s
/usr/local/openjdk-8/bin/java -jar /home/jmeter/apache-jmeter-5.2/bin/ApacheJMeter.jar $@
