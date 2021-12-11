# ER Technical Assignment Task

## How to Set up project
Clone this repository to your local folder

```
git clone https://github.com/vendera-hadi/ertask.git
```

### Using Docker
Follow the instructions to install [Docker](https://docs.docker.com/engine/install/ubuntu/) and [Docker Compose](https://docs.docker.com/compose/install/)

After that, build the project using this code on project repository
```
docker-compose build
```

Then Run the server using
```
docker-compose up
```

Open this link to access the project
```
localhost:3000
```

### Using Rbenv
Follow the instructions to install *rbenv* [here](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04) 

After installing *Rbenv*, run these several line of codes
```
rbenv install 3.0.2
gem install rails
gem install bundler
bundle install
```

Then run the server using this code
```
rails s
```

Open this link to access the project
```
localhost:3000
```
