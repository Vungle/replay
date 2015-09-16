[![Circle CI](https://circleci.com/gh/Vungle/replay.svg?style=svg)](https://circleci.com/gh/Vungle/replay)

# Replay Logs to Kafka Topic

### How?

1. Clone and set kafka topic in the docker-compose.yml

1. use s3 to download logs
`aws s3 cp "s3://vungle-logs/raw_logs/secor_backup/as-reportAds/dt=2015-09-15/hr=07" log --recursive`

1. Set your code to read from the kafka server `$(docker-machine ip dev):9092"`

1. from this directory run `docker-compose up && sleep 5 && docker-compose logs`

### Results

All logs in the log directory will be ingested by heka and inserted into the kafka topic specified
