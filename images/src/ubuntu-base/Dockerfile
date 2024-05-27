FROM buildpack-deps:noble-curl@sha256:8a6126ff5fbb9bd03dd782858536df8af3edbbd61bd64d9fbb7db22ce5328a35

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gettext \
        moreutils \
        runit \
        software-properties-common \
        tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN update-rc.d procps remove

ENTRYPOINT ["/lib/runit/runit-init"]
