Carrierwave iOS Backend
=========================================

Carrierwave iOS API, built with Ruby on Rails. It is ready to work locally or on Heroku/S3 from the get-go. 


Requirements
============

| Name |  Version |
| :--: | :---: |
| [Ruby][ruby] | 2.1.5 |
| [Ruby on Rails][rails] | 4.1.8 |

You can find some guidelines on how to install the above [on mac][mac_guidelines] and [on ubuntu][ubuntu_guidelines]

#### Recommended

Install git with:
- on mac - `brew install git`
- on ubuntu - `apt-get install git`


Config
==================

### Cloning repository

- clone repository with `git clone https://github.com/netguru/carrierwave-ios-rails-example.git`

### Environment variables

- copy .env.sample to .env `cp .env.sample .env`,
- fill in your domain name and url - in the local environment it's normally `localhost` and `http://localhost:3000` respectively,
- generate your own `SECRET_KEY_BASE` by running `rake secret` and pasting the output into .env file,
- you can omit Rollbar config in the development environment.

### Database

- copy config/database.yml.sample to config/database.yml `cp config/database.yml.sample config/database.yml`
- run in terminal respectively:
  - `rake db:create`
  - `rake db:schema:load`
  - `rake db:seed`

### Guardfile

- copy Guardfile.sample to Guardfile `cp Guardfile.sample Guardfile`

### Uploading app to Heroku

We can read on Carrierwave gem wiki, that "Heroku has a read-only filesystem, so uploads must be stored on S3 and cannot be cached in the public directory."
This means that in order for this backend to work on Heroku, you need a configured S3 bucket. Here is the info on how to do it - http://aws.amazon.com/s3/.
All of the instructions below assume that you have:
  - cloned the project from github,
  - run `bundle install`,
  - configured S3 bucket,
  - a Heroku account.

To upload project to Heroku:
- install Heroku toolbelt per [this](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up) instructions,
- go to the project's directory (the one created by `git clone <project's URL>`),
- run `heroku create` - this command creates new Heroku project and associates it with your local git repository,
- define config vars per [this](https://devcenter.heroku.com/articles/getting-started-with-ruby#define-config-vars) instructions. You need to add those keys:
  - `SECRET_KEY_BASE` - generated by `rake secret`
  - `DEFAULT_SENDER` - for example `no-reply@no-reply.com`
  - `S3_KEY`, `S3_BUCKET_NAME` and `S3_SECRET` - your S3 bucket configuration
- run `git push heroku master` - to push the project to Heroku
- run `heroku run rake db:migrate` - to apply migrations
- run `heroku restart` - to restart app's server
- run `heroku open` - to open the app in your browser
- test your app running `curl --form attachment[file]=@/path/to/image.png https://<your heroku app name>.herokuapp.com/api/v1/attachments`

Contribution
============

First, thank you for contributing!

Here's a few guidelines to follow:

- we follow [Ruby Style Guide][ruby_style_guides].
- you can use [rubocop][rubocop] which can be easily integrated with popular editors. ([our rubocop config][rubocop_config])
- keep gems up to date - you can use [gemsurance][gemsurance] to check for outdated gems - simply run `bundle exec gemsurance`.
- write tests
- make sure the entire test suite passes
- make sure rubocop passes our config
- open a pull request on GitHub
- [squash your commits][squash_commits] after receiving feedback

Copyright  2015 © [Netguru][netguru_url], released under the New BSD License

[heroku_docs]: https://carrierwave-ios-rails-example.herokuapp.com/doc
[ruby]: https://www.ruby-lang.org
[rails]: http://www.rubyonrails.org
[postgres]: http://www.postgresql.org
[ios_devise]: https://github.com/netguru/devise-ios
[mac_guidelines]: https://gorails.com/setup/osx/10.10-yosemite
[ubuntu_guidelines]: https://gorails.com/setup/ubuntu/14.10
[postgres_guidelines]: https://wiki.postgresql.org/wiki/Detailed_installation_guides
[spring]: https://github.com/rails/spring
[ruby_style_guides]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://github.com/bbatsov/rubocop
[rubocop_config]: https://github.com/netguru/hound/blob/master/config/rubocop.yml
[gemsurance]: https://github.com/appfolio/gemsurance
[squash_commits]: http://blog.steveklabnik.com/posts/2012-11-08-how-to-squash-commits-in-a-github-pull-request
[netguru_url]: https://netguru.co
