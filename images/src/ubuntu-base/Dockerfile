FROM buildpack-deps:jammy-curl@sha256:d9695055e7e1a2582e6edc6a7a05cf7eba229ae0c4dbca24e2ebd58435993ecc

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gettext \
        moreutils \
        runit \
        tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN \
    update-rc.d -f procps remove && \
    touch /etc/runit/no.emulate.sysv

ENTRYPOINT ["/lib/runit/runit-init"]
