# ER Technical Assignment Task

## How to Set up project
Clone this repository to your local folder

```
git clone git@github.com:vendera-hadi/ertask.git
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

### Endpoint
```
GET localhost:3000/scores
```

### Request Payload
```json
{
    "scores": {
        "managers": [
            {
                "userId": 1,
                "score": 1
            },
            {
                "userId": 2,
                "score": 5
            }
        ],
        "team": [
            {
                "userId": 4,
                "score": 1
            },
            {
                "userId": 5,
                "score": 5
            },
            {
                "userId": 6,
                "score": 3
            },
            {
                "userId": 7,
                "score": 2
            }
        ],
        "others": [
            {
                "userId": 8,
                "score": 1
            },
            {
                "userId": 9,
                "score": 5
            }
        ]
    }
}
```

### Response
```json
{
    "success": true,
    "data": {
        "scores": {
            "managers": 3.0,
            "team": 2.75,
            "others": 0
        }
    },
    "errors": []
}
```

### Run test

On the repository directory, run this code to run the tests

If using docker
```
docker-compose run web rails test
```

If using rbenv
```
rails test
```
