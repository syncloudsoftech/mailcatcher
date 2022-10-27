# mailcatcher

[Docker](https://www.docker.com) image for running a local [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) server to test outgoing emails (powered by [MailCatcher](https://mailcatcher.me)).

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/syncloudsoftech/docker-mailcatcher/ci)
![Docker Pulls](https://img.shields.io/docker/pulls/syncloudsoftech/mailcatcher)

## Usage

To launch a container from this image, you must have [Docker](https://www.docker.com) installed.
If already, run the below command:

```shell
docker run -d --name mailcatcher -p 1025:1025 -p 1080:1080 syncloudsoftech/mailcatcher
```

To start/stop the (named) container at a later point in time, use below commnads:

```
# start "mailatcher" named container
$ docker start mailcatcher

# stop "mailatcher" named container
$ docker stop mailcatcher
```

### docker-compose.yml

To include this container as a service in your existing `docker-compose.yml` setup, use below definition:

```yml
version: '3'

services:
  mailcatcher:
    image: syncloudsoftech/mailcatcher
    environment:
      HTTP_PORT: '1025' # optional
      SMTP_PORT: '1080' # optional
    ports:
      - '1025:1025'
      - '1080:1080'
```

### Laravel

If your app is built with [Laravel](https://laravel.com/), you can configure it to use our docker service by adding below configuration to your `.env` file.

```env
MAIL_MAILER=smtp
# or use MAIL_HOST=127.0.0.1 if using host network
MAIL_HOST=mailcatcher
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"
```

### Node.js

If your app uses [nodemailer](https://nodemailer.com/), configure it to use our docker service using below code:

```js
const transporter = nodemailer.createTransport({
  host: 'mailcatcher', // or use 127.0.0.1 if using host network
  port: 1025,
  secure: false,
});
```

## Development

Building a container from straight from this project is easy.
Just clone the repository and run below command:

```shell
$ docker build -t mailcatcher .
```

Run the locally built container as follows:

```shell
$ docker run -it -p 1025:1025 -p 1080:1080 mailcatcher
```

## License

See the [LICENSE](LICENSE) file.
