# docker-unoconv-webservice
Dockerimage to run unoconv as a webservice through [tfk-api-unoconv](https://github.com/zrrrzzt/tfk-api-unoconv).

If you prefer a pre-build version it is available from [hub.docker.com](https://registry.hub.docker.com/u/zrrrzzt/docker-unoconv-webservice/)
just do a regular pull

```sh
$ docker pull zrrrzzt/docker-unoconv-webservice
```

# Build

```sh
$ docker build -t docker-unoconv-webservice .
```

# Run - example
```sh
$ docker run -d -p 80:3000 --name unoconv docker-unoconv-webservice
```

or if you use the pre-build version

```sh
$ docker run -d -p 80:3000 --name unoconv zrrrzzt/docker-unoconv-webservice
```

# Usage

Post the file you want to convert to the server and get the converted file in return.

See all possible conversions on the [unoconv website](http://dag.wiee.rs/home-made/unoconv/).

API for the webservice is /unoconv/{format-to-convert-to} so a docx to pdf would be

```sh
$ curl --form file=@myfile.docx http://192.168.99.100/unoconv/pdf > myfile.pdf
```
