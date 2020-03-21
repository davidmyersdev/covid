# covid

Post a tweet with the current status of COVID in Ohio, USA.

## about

This script posts a tweet for the authorized account similar to this.

```
[Automated] Ohio COVID update.

Cases: 174
Recovered: 0
Deaths: 3
```

The data is pulled from [worldometers.info](https://www.worldometers.info/coronavirus) using [NovelCOVID/API](https://github.com/NovelCOVID/API).

## how to run

Create a `.env` file. Add the following to it.

```shell
CONSUMER_KEY=your_consumer_key
CONSUMER_SECRET=your_consumer_secret
ACCESS_TOKEN=your_access_token
ACCESS_TOKEN_SECRET=your_access_token_secret
```

Install dependencies, and run the script.

```shell
# install dependencies
bundle

# run script
ruby tweet.rb
```
