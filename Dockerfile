FROM ubuntu:20.04
LABEL maintainer="https://github.com/sommeru/cubesql"

EXPOSE 4430
 
RUN apt-get -y update && apt-get -y upgrade && \
	apt-get -y install wget sudo psmisc && \
	mkdir /cubesql-install && \
	wget https://www.sqlabs.com/download/cubesql/572/cubesql_linux64bit.tar.gz --output-document=/cubesql-install/cubesql_linux64bit.tar.gz && \
	tar -xzf /cubesql-install/cubesql_linux64bit.tar.gz -C / && \
	cd /cubesql_64bit && \
	/cubesql_64bit/install.sh && \
	rm -rf /cubesql-install && \
	rm -rf /cubesql_64bit

ENTRYPOINT /opt/cubesql/cubesql
