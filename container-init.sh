#!/bin/sh
tor --runasdaemon 1
polipo proxyAddress=0.0.0.0 proxyPort=8123 socksParentProxy="127.0.0.1:9050" socksProxyType=socks5 diskCacheRoot="" logLevel=0x0 daemonise=true
/usr/local/openjdk-8/bin/java -jar /home/jmeter/apache-jmeter-5.2/bin/ApacheJMeter.jar -n -H 127.0.0.1 -P 8123 $@
