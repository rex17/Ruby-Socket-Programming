# README #

This application is based on Ruby Sockets which demonstrate communication between client and server. Client generates a random key then it gets filtered for UTF-8 non compliance characters. Client sends this message to while Server is listening, server then captures the message and writes to log file. 

To check out the documentation, run the command:
```
#!ruby

yard server

```
then open the server URL provided by yard server in a browser.

* Summary of set up
To setup the environment:
1.install ruby 2.3.3
2.install bundle gem using command -

```
#!ruby

gem install bundle

```
3.basic competency of ruby 


* Configuration
1.Go to project root directory and run this command:
```
#!ruby

bundle install
```

* Dependencies
All the dependencies will be handled in Gemfile.lock itself.

* Database configuration
No DB config required.

* How to run tests
To run tests, Go to root directory and run command:
```
#!ruby

rspec

```

* How to run application:

Go to the root directory and run the command:


```
#!ruby

rake --tasks

```

then first run the server task for server initialization, run rake task command:


```
#!ruby

rake socket_app_server ENV=development
```


once its up and running, run the Client task for message transfer to server for further processing.run the rake task command in another command prompt window:


```
#!ruby

rake socket_app_client ENV=development
```

Check the log_file.txt in logs directory received message will get written.