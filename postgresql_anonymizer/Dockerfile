ARG BASE=ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie
FROM $BASE AS builder

ARG PG_MAJOR
ARG EXT_VERSION

USER 0

RUN apt-get update && \
    apt-get install -y curl lsb-release gpgv

RUN echo deb http://apt.dalibo.org/labs $(lsb_release -cs)-dalibo main > /etc/apt/sources.list.d/dalibo-labs.list && \
	curl -fsSL -o /etc/apt/trusted.gpg.d/dalibo-labs.gpg https://apt.dalibo.org/labs/debian-dalibo.gpg

RUN echo 'APT::Key::gpgvcommand "/usr/bin/gpgv";' | tee /etc/apt/apt.conf.d/999force-gpgv

RUN apt-get update && \
    apt-get install -y postgresql_anonymizer_${PG_MAJOR}=${EXT_VERSION}

FROM scratch
ARG PG_MAJOR

# Licenses
#COPY --from=builder /usr/share/doc/postgresql-${PG_MAJOR}-pgaudit/copyright /licenses/postgresql-${PG_MAJOR}-pganon/
#COPY --from=builder /usr/share/doc/postgresql-18-pganon/copyright /licenses/postgresql-18-pganon/

# Libraries
COPY --from=builder /usr/lib/postgresql/${PG_MAJOR}/lib/anon* /lib/

# Share
COPY --from=builder /usr/share/postgresql/${PG_MAJOR}/extension/anon* /share/extension/

USER 65532:65532
