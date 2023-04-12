<h2><b>demo app - developing with Docker</b></h2>
<br />

- index.html with pure JS and CSS style
- nodejs backend with express module
- mongodb for a data storage

All components are docker-based

<h2><b>With Docker</b></h2>

<b>To start the application</b>

Step 1: Create docker network <br />

> docker network create mongo-network

Step 2: start mongodb <br />

> docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo

Step 3: start mongo-express <br />

> docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express

NOTE: creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command <br />

Step 4: open mongo-express from browser <br />

> http://localhost:8081

Step 5: create `user-account` <i>db</i> and `users` <i>colleciton</i> in mongo-express <br />

Step 6: Start your nodejs application locally - go to `app` directory of project <br />

> npm install
> <br />
> node server.js

Step 7: Access your nodejs application UI from browser <br />

> http://localhost:3000

<h2><b>With Docker Compose</b></h2>

<b>To start the application</b>

Step 1: start mongodb and mongo-express <br />

> docker-compose -f docker-compose.yaml up

<i>You can access the mongo-express under localhost:8080 from your browser</i><br />

Step 2: in mongo-express UI - create a new datbase "my-db"<br />

Step 3: in mongo-express UI - create a new collection "users" in the database "my-db" <br />

Step 4: start node server <br />

> npm install
> <br />
> noder server.js

Step 5: access the nodejs application from browser <br />

> http://localhost:3000

<h2><b>To build a docker image from the application</b></h2><br />

> docker build -t my-app:1.0 .

The dot "." at the end of the command denotes location of the Dockerfile.
