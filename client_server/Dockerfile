FROM ruby:3.1.2

ENV DEBIAN_FRONTED=noninteractive

# On change this settings, check the state on "before_script" in .gitlab-ci.yml
RUN apt-get update && apt-get install -y \
  sudo \
  build-essential \
  ruby-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ADD an user
RUN adduser --disabled-password --gecos '' devel \
  && usermod -a -G sudo devel \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && echo 'devel:devel' | chpasswd

ENV HOME=/home/devel
ENV APP=/var/www/app
ENV BUNDLE_PATH=/bundle/vendor
ENV GEM_HOME=${BUNDLE_PATH}
ENV PATH=${PATH}:${BUNDLE_PATH}/bin

ENV RAILS_LOG_TO_STDOUT true

RUN mkdir -p ${HOME} && \
  chown -R devel:devel ${HOME} && \
  mkdir -p ${APP} && \
  chown -R devel:devel ${APP} && \
  mkdir -p ${BUNDLE_PATH} && \
  chown -R devel:devel /bundle

USER devel:devel
WORKDIR $APP

RUN gem install bundler -v 2.1.4

CMD ["/usr/bin/sudo", "/usr/sbin/sshd", "-D"]
