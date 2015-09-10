# omkafka

Try rsyslog module for Apache kafka, [omkafka](http://www.rsyslog.com/doc/master/configuration/modules/omkafka.html) on Docker container. 

## Build

```bash
$ docker build -t tcnksm/omkafka .
```

## Usage

Start kafka broker,

```bash
$ docker run --rm -it \
    --name kafka \
    --publish 9092:9092 \
    --env ADVERTISED_HOST=${DOCKER_HOST} \
    --env ADVERTISED_PORT=9092 \
    tcnksm/single-kafka
```

Login to rsyslog docker container with link to kafka broker,

```bash
$ docker run --rm -it --link kafka:kafka tcnksm/omkafka bash
```

Check kafka broker host it's provided via env var,

```bash
# env
```

Run rsyslog and send log by hand,

```bash
# rsyslog
# logger 'Hello, world'
```

Check the log can be consumed, you can find `Hello world` message. 

```bash
$ kafkacat -C -t omkafka -b ${DOCKER_HOST}:9092
```

