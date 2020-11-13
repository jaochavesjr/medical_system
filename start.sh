# Instala as Gems
bundle check || bundle install
​
# Roda o servidor
bundle exec puma -C config/puma.rb
