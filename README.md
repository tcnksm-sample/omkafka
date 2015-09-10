# omkafka

Try rsyslog kafka producer module, [omkafka](http://www.rsyslog.com/doc/master/configuration/modules/omkafka.html).

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
    --env ADVERTISED_HOST=192.168.59.103 \
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

Check the log can be consumed,

```bash
$ kafkacat -C -t omkafka -b 192.168.59.103:9092
```

