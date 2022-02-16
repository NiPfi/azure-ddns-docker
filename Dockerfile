FROM mcr.microsoft.com/azure-cli
# Install tools
RUN apk update \
 && apk add --no-cache curl bind-tools \
 && rm -rf /var/cache/apk/*

WORKDIR /work
COPY entrypoint.sh /work/
RUN chown -R 1000:0 /work && \
    chmod +x /work/entrypoint.sh
ENV HOME=/work
USER 1000

ENTRYPOINT [ "/work/entrypoint.sh" ]
