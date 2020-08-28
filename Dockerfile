FROM alpine:3.12

ENV BASH_VERSION=5.0.17-r0 \
    CACERTIFICATES_VERSION=20191127-r4 \
    GCC_VERSION=9.3.0-r2 \
    GIT_VERSION=2.26.2-r0 \
    HELM_VERSION=2.16.1 \
    MUSL_DEV_VERSION=1.1.24-r9 \
    PERL_VERSION=5.30.3-r0 \
    PRE_COMMIT_VERSION=2.6.0 \
    PYTHON3_VERSION=3.8.5-r0 \
    PYTHON3_PIP_VERSION=20.1.1-r0 \
    TERRAFORM_VERSION=0.12.28 \
    TERRAFORM_DOCS_VERSION=v0.9.1 \
    TFLINT_VERSION=v0.16.2

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["pre-commit"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="pre-commit" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.12" \
      "org.label-schema.description"="pre-commit in a container" \
      "org.label-schema.url"="https://pre-commit.com/" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-pre-commit" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.bash.version"=$BASH_VERSION \
      "org.label-schema.applications.ca-certificates.version"=$CACERTIFICATES_VERSION \
      "org.label-schema.applications.helm.version"=$HELM_VERSION \
      "org.label-schema.applications.git.version"=$GIT_VERSION \
      "org.label-schema.applications.perl.version"=$PERL_VERSION \
      "org.label-schema.applications.pre-commit.version"=$PRE_COMMIT_VERSION \
      "org.label-schema.applications.python3.version"=$PYTHON3_VERSION \
      "org.label-schema.applications.python3_pip.version"=$PYTHON3_PIP_VERSION \
      "org.label-schema.applications.terraform.version"=$TERRAFORM_VERSION \
      "org.label-schema.applications.terraform-docs.version"=$TERRAFORM_DOCS_VERSION \
      "org.label-schema.applications.tflint.version"=$TFLINT_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/pre-commit --help"
