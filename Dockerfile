FROM ubuntu:20.04 as base
ARG USER
ARG EMAIL
WORKDIR /tmp
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive
ENV USER ${USER}
ENV EMAIL ${EMAIL}
ENV HOME /home/${USER}
COPY base/entrypoint-docker.sh /usr/local/bin/
COPY base/setup.sh base/packages ./
RUN /tmp/setup.sh && \
    rm -rf /tmp/setup.sh /tmp/packages

FROM base
ARG USER
ARG EMAIL
ARG IDE_LANG
ENV DEBIAN_FRONTEND noninteractive
ENV USER ${USER}
ENV EMAIL ${EMAIL}
ENV HOME /home/${USER}
ENV IDE_LANG ${IDE_LANG}
USER ${USER}
WORKDIR ${HOME}
COPY --chown=${USER}:${USER} ${IDE_LANG}/bash_inc .local/.bash_inc
COPY --chown=${USER}:${USER} ${IDE_LANG}/setup_lang.sh setup_lang.sh
COPY --chown=${USER}:${USER} ${IDE_LANG}/packages packages
COPY --chown=${USER}:${USER} ${IDE_LANG}/settings.json .local/share/code-server/User/settings.json
RUN ./setup_lang.sh && \
    rm -rf ${HOME}/.env ${HOME}/setup_lang.sh ${HOME}/packages
#VOLUME [ "/home/${USER}/project" ]
#VOLUME [ "/home/${USER}/.aws" ]
#VOLUME [ "/home/${USER}/.ssh" ]
EXPOSE 8443
ENTRYPOINT ["dumb-init", "--", "entrypoint-docker.sh"]
CMD ["code-server", "--host", "0.0.0.0", "--port", "8443", "--auth", "none", "--locale", "en-US"]
