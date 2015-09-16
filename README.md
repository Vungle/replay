[![Circle CI](https://circleci.com/gh/Vungle/replay.svg?style=svg)](https://circleci.com/gh/Vungle/replay)

# Replay Logs to Kafka Topic

### PRE

You need to have docker-machine & docker compose installed. You can get everything you need installed using the docker toolbox:
https://www.docker.com/toolbox

### Setup

1. Clone and set kafka topic in the docker-compose.yml

1. use s3 to download logs
`aws s3 cp "s3://vungle-logs/raw_logs/secor_backup/as-reportAds/dt=2015-09-15/hr=07" log --recursive`

1. Set your code to read from the kafka server `$(docker-machine ip dev):9092"`

### Running

From the current directory run `docker-compose up && docker-compose logs replay` then you should see heka output showing its consuming the logs and inserting into your kafka topic

### Stopping & Cleanup

From the current directory run `docker-compose kill && docker-compose rm --force`

### Results

![](http://d.pr/i/15tFg.gif)

### Helpful Aliases:

```
alias dc="docker-compose"
alias dc_clear="dc kill && dc rm --force"
alias dm="docker-machine"
alias dmip="docker-machine ip dev"
alias dcup="dc up -d && sleep 5 && dc logs"
alias dcl="dc logs"
```
