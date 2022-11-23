FROM rabbitmq:3.8-management

ENV DEBIAN_FRONTED=noninteractive

# On change this settings, check the state on "before_script" in .gitlab-ci.yml
RUN apt-get update && apt-get install -y \
  sudo \
  build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ADD an user
RUN adduser --disabled-password --gecos '' devel \
  && usermod -a -G sudo devel \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && echo 'devel:devel' | chpasswd

ENV HOME=/home/devel
ENV PATH=${PATH}:${BUNDLE_PATH}/bin

RUN mkdir -p ${HOME} && \
  chown -R devel:devel ${HOME} && \
  mkdir -p ${APP} && \
  chown -R devel:devel ${APP} && \
  mkdir -p ${BUNDLE_PATH} && \
  chown -R devel:devel /bundle

USER devel:devel
WORKDIR $APP

CMD ["/usr/bin/sudo", "/usr/sbin/sshd", "-D"]
