Open Source Carrierwave iOS Rails Backend
=========================================

Requirements
============

| Name |  Version |
| :--: | :---: |
| [Ruby][ruby] | 2.1.5 |
| [Ruby on Rails][rails] | 4.1.8 |

You can find some guidelines on how to install above [on mac][mac_guidelines] and [on ubuntu][ubuntu_guidelines]

#### Optional (recommended)

- git (mac - `brew install git`, ubuntu - `apt-get install git`)


Contribution
============

First, thank you for contributing!

Here a few guidelines to follow:

- we follow [Ruby Style Guide][ruby_style_guides].
- you can use [rubocop][rubocop] which can be easily integrated with popular editors. ([our rubocop config][rubocop_config])
- keep gems up to date - you can use [gemsurance][gemsurance] to check for outdated gems - simply run `bundle exec gemsurance`.
- write tests
- make sure the entire test suite passes
- make sure rubocop passes, our config
- open a pull request on GitHub
- [squash your commits][squash_commits] after receiving feedback

Copyright  2015 © [Netguru][netguru_url], released under the New BSD License

[heroku_docs]: https://devise-ios-rails-example.herokuapp.com/doc
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
