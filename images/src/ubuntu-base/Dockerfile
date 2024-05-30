FROM buildpack-deps:jammy-curl@sha256:475dd866a123ef34cf510567060a75a3df02440fcd9ad62fb72c14197dcdc491

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gettext \
        moreutils \
        runit \
        tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN \
    update-rc.d procps remove && \
    touch /etc/runit/no.emulate.sysv

ENTRYPOINT ["/lib/runit/runit-init"]
