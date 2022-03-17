FROM alpine:3.13

ENV BASH_VERSION=5.1.0-r0 \
    CACERTIFICATES_VERSION=20191127-r5 \
    GCC_VERSION=10.2.1_pre1-r3 \
    GIT_VERSION=2.30.1-r0 \
    HELM_VERSION=2.17.0 \
    MUSL_DEV_VERSION=1.2.2-r0 \
    PERL_VERSION=5.32.0-r0 \
    PRE_COMMIT_VERSION=2.10.1 \
    PYTHON3_VERSION=3.8.7-r1 \
    PYTHON3_PIP_VERSION=20.3.4-r0 \
    TERRAFORM_VERSION=0.14.7 \
    TERRAFORM_DOCS_VERSION=v0.11.2 \
    TFLINT_VERSION=v0.24.1 \
    TFSEC_VERSION=0.39.5

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
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-pre-commit" \
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
      "org.label-schema.applications.tfsec.version"=$TFSEC_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/pre-commit --help"
