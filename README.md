Documentation
============

This is an implementation of Acapela Voice as a Service for Ruby. 
http://www.acapela-vaas.com/

Setup
------------

	#initializer
	Acapela::Vaas.credentials = {login: "login_name", password: "password", app: "app_name"}

Usage
-----------

## Create a new sound file:

	Acapela::Vaas.say("This is a sample text")

### Options:

* speaker
* sound_id

If sound_id is passed as an argument, Acapela Vaas will try to retrieve an already created sound with this id.
