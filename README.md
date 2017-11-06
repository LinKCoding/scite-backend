# Scite

Scite ("Science-Note") is an app that provides students with the basic tools to break down a science article. Users can view the science article of the day or check back on archived articles to start a note. Users can always go back to edit their notes or delete the note if he/she so chooses. In taking notes, students can also add words to their lexicons. Ideally, students can derive the definition through context clues, but there is also a built in dictionary component for ease of searching.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Must have rvm installed, this app was made with version 1.29.2, ruby version 2.3.3p222

### Installing
Clone (and fork if you want to contribute)
run
```
$ bundle install
```

Then:
```
$ rails s
```
Note: that if you're running both this app and the frontend app locally, there can be a conflict in ports. A simple solution is to start the rails server first and then `yarn start` on the frontend to choose another port. You can also manually change it for either the react app or for this app.

You can also check out: https://scite.herokuapp.com for an up and running demo.
Please note due to the time it takes for backend to start up after sleeping, the request may timeout. A simple refresh should solve the issue.


## Built With

* Ruby
* Ruby on Rails
* PostgreSQL
* bcrypt
* jwt

## Rake task
To run the custom rake task run
```
$ rake grab_article:fetch
```
You will need to get set up your BingNews API key  and store it in your .env file.
Certain sites like foxnews and cnn will not allow hosting on the frontend and so those sites are skipped over. If there are any more feel free to let me know through an issue. 

## Authors

* Kenny Lin, check out other projects at https://github.com/LinKCoding

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to everyone who took the time to check out the site and gave feedback. Special thanks for my Flatiron cohort!
