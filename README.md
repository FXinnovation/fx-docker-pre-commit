# pre-commit docker image

## Description

This image contains python [pre-commit](https://pre-commit.com/).
It also contains specific tools (e.g. terraform-docs) to run the tool.

## Tags

We push a `latest` tag on this repository, to run an older version please checkout the different tags.

## Usage

`docker run --rm -v $(pwd):/data fxinnovation/pre-commit --help`

## Labels

We set labels on our images with additional information on the image.
We follow the guidelines defined at http://label-schema.org/. 
Visit their website for more information about those labels.

## Comments & Issues

If you have comments or detect an issue, please be advised we don't check the docker hub comments.
You can always contact us through the repository.
