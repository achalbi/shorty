Shorty 

It is a Rails API to generate short URLs for website

Rails 5.0.0
Ruby 2.3.0

Below are the list of APIs that are available which also conatins header and body params

* header: 
	Content-Type : application/vnd.api+json
	X-Api-Key : TNZCmuthS2qjGYjbPcPdFhw2 (token used to Athenticate user)	

* User : [create, show, update, destroy] : http://localhost:3000/users
	body: { "user": {
                        "name": "Number7",
                        "password": "password",
                        "email": "ach2@asd.com",
                        "password_confirmation": "password" }}

* Short_urls : [ index, create, update, destroy ] : http://localhost:3000/short_urls
	body: {	"short_url": {
                        "original_url": "www.google.com"}}

* Short_visits : [ index, show destroy ] : http://localhost:3000/short_visits

* sessions : [ create, destroy ] : http://localhost:3000/sessions
	body: { "session": {
                        "password": "password",
                        "email": "ach2@asd.com"}}

* Short URLS : http://localhost:3000/XXXXX
	short urls are generated from alphanumeric code generator.
