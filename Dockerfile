FROM ruby:2.7.1
# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Instala as dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano
# Instalar bundler
RUN gem install bundler
# Seta o path
ENV INSTALL_PATH /medical_system
# Cria o diretório
RUN mkdir -p $INSTALL_PATH
# Seta o o path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o o Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /gems
# Copia o código para dentro do container
COPY . .
