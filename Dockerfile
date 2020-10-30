FROM ubuntu:20.04
ARG USER
ARG EMAIL
WORKDIR /tmp
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive
ENV USER ${USER}
ENV EMAIL ${EMAIL}
COPY entrypoint-docker.sh /usr/local/bin/
COPY setup.sh packages ./
RUN ./setup.sh ${USER} && rm -rf /tmp/*
USER ${USER}
WORKDIR /home/${USER}
COPY --chown=${USER}:${USER} bash_inc .local/.bash_inc
RUN source .local/.bash_inc && \
    upGo && \
    upTerraform && \
    upAWS && \
    upCodeServer && \
    git config --global user.name ${USER} && \
    git config --global user.email ${EMAIL}
VOLUME [ "/home/${USER}/project" ]
VOLUME [ "/home/${USER}/.aws" ]
VOLUME [ "/home/${USER}/.ssh" ]
EXPOSE 8443
ENTRYPOINT ["dumb-init", "--", "entrypoint-docker.sh"]
CMD ["code-server", "--host", "0.0.0.0", "--port", "8443", "--auth", "none", "--locale", "en-US"]
