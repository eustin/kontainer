FROM ubuntu:18.04

ENV SPARK_VERSION 2.4.5
ENV HADOOP_VERSION 2.7
ENV SPARK_FNAME spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV SPARK_DIR /usr/local/spark

# this is what pyspark looks for
ENV SPARK_HOME ${SPARK_DIR}/${SPARK_FNAME}

# make directories
RUN mkdir ${SPARK_DIR}

# update all packages
RUN apt-get update

# uitls
RUN apt-get install -y curl

# python
RUN apt-get install -y python3 python3-pip python3-setuptools

# install scala
RUN apt-get install -y openjdk-8-jdk scala

# get spark
RUN curl -L "http://apache.mirror.amaze.com.au/spark/spark-${SPARK_VERSION}/${SPARK_FNAME}.tgz" \
	| gunzip \
	| tar x -C /usr/local/spark/

# install node.js for jupyterlab extensions
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash
RUN apt-get install -y nodejs

# install python packages
COPY requirements.txt .

RUN pip3 install jupyterlab && jupyter serverextension enable --py jupyterlab && jupyter labextension install @jupyterlab/toc
RUN pip3 install -r requirements.txt

# ports
EXPOSE 8888
EXPOSE 6006

ENTRYPOINT ["/bin/bash"]
