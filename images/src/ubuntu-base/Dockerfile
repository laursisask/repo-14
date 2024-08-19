FROM buildpack-deps:noble-curl@sha256:89d386c8f78b79b2909302d628fda30445c2d7addf18f10b34372b48f4a49e50

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gettext \
        moreutils \
        runit \
        tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && deluser --remove-home ubuntu

RUN \
    update-rc.d -f procps remove && \
    touch /etc/runit/no.emulate.sysv

ENTRYPOINT ["/lib/runit/runit-init"]
