# Replay Logs to Kafka Topic

### How?

1. Copy the docker-compose.yml

1. Create a log folder

1. use s3 to download logs
`aws s3 cp s3://vungle-logs/consumer-reportad01/consumer_reportad/consumer_reportad.out log/`

1. Set your code to read from the kafka server $(docker-machine ip dev):9092 and to topic "inf-replay"

1. from this directory run `docker-compose up && sleep 5 && docker-compose logs`

### Results

All logs in the log directory will be ingested by heka and inserted into the "inf-replay" topic
