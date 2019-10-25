ARG BASEIMAGE=alpine:latest
FROM ${BASEIMAGE}

ARG HUGO_VERSION=0.59.0
ARG OPERATING_SYSTEM=Linux
ARG ARCH=ARM64
ARG BUILD_DATE=20191025
ARG VCS_REF
ARG VERSION=1.0

LABEL mantainer="Orange <orange@nerocats.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name=$BASEIMAGE \
    org.label-schema.description="Hugo for arm64" \
    org.label-schema.url="https://www.nerocats.com" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/QCEnjoyLL/hugo-arm" \
    org.label-schema.vendor="Orange" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${OPERATING_SYSTEM}-${ARCH}.tar.gz /tmp
RUN tar -xf /tmp/hugo_${HUGO_VERSION}_${OPERATING_SYSTEM}-${ARCH}.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_${OPERATING_SYSTEM}-${ARCH}

VOLUME /src
VOLUME /output

WORKDIR /src

ENTRYPOINT ["hugo"]

EXPOSE 1313
