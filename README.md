# luzifer-docker / Geneshift

Run [Geneshift](https://www.geneshift.net) dedicated server in a Docker container

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/geneshift .

## Create config (optional)
$ tree
.
└── config.ini

0 directories, 1 file

## Execute Geneshift
$ docker run --rm -ti -v $(pwd):/config luzifer/geneshift
```
