FROM python:slim-buster

WORKDIR /opt/s3wipe

RUN set -eux ; \
    groupadd  -r s3wipe && useradd -m -g s3wipe s3wipe ;

USER s3wipe

RUN pip install --user --no-cache-dir boto

COPY --chown=s3wipe:s3wipe . ./

RUN chmod 755 s3wipe

ENTRYPOINT ["./s3wipe"]
