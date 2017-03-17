FROM openjdk:8-jdk

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
	apt-get update && \
	apt-get install apt-utils -y && \
	apt-get install apt-transport-https -y && \
	echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-5.x.list && \
	cat /etc/apt/sources.list.d/elastic-5.x.list && \
	apt-get update && \
	apt-get install filebeat && \
	apt-get install metricbeat && \
	apt-get install packetbeat && \
	update-rc.d filebeat defaults 95 10 && \
	update-rc.d metricbeat defaults 95 10 && \
	update-rc.d packetbeat defaults 95 10

WORKDIR /root