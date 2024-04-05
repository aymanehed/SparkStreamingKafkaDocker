FROM spark-base

# -- Runtime
ARG spark_version=2.3.2

ARG spark_worker_web_ui=8081

EXPOSE ${spark_worker_web_ui}
EXPOSE 18080
COPY jars/spark-java-example-1.0-SNAPSHOT.jar examples/jars/spark-simple-example.jar
COPY jars/spark-streaming-job-1.0-SNAPSHOT.jar examples/jars/spark-streaming-example.jar

COPY ./spark-defaults.conf conf/spark-defaults.conf
RUN apt-get update && apt install -y openjdk-17-jdk
# RUN source /etc/profile
CMD bash -c "sbin/start-history-server.sh  &&  bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out" 