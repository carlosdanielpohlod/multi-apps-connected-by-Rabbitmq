# imagem base para as aplicações Rails
FROM ruby:3.1.2

# instalando as dependências
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# setando o diretório de trabalho
RUN mkdir /myapp
WORKDIR /myapp

ARG APP_NAME

# instalando as gems do Rails
COPY checkout_server/Gemfile /myapp/Gemfile
COPY checkout_server/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# copiando o código da aplicação para o container
COPY . /myapp

# setando a variável de ambiente para o Rails
ENV RAILS_ENV=development

# rodando os comandos do Rails
RUN rails db:create && \
    rails db:migrate && \
    rails db:seed

# expondo a porta
EXPOSE 3000

# iniciando o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
