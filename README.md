# README

### build project via docker

```
cd medical_system
docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app bundle exec rails db:create db:migrate
docker-compose run --rm app bundle exec rails webpacker:install
```

```
###if you need

yarn install

### to run the application

docker-compose up

### Dependencies & Versions

* Ruby 2.7.1

* Rails 6.0.3.4

* Database: Postgresql


