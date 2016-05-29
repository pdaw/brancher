Simple Ruby pet project created to simplify manual testing of software on many git repositories in my team :)

#### Functionalities:
- Checking out branches for many repositories (pull if you already are)
- Upload of files (except blacklisted, for example vendor)
- Invoking remote commands (for example in order to cleaning cache)

#### Dependencies:
- [Ruby 2.3 + RubyGems](http://rubyinstaller.org/downloads/)
- [Git](https://git-scm.com/downloads)

#### Installation:
- enter `gem install bundler` to install [bundler](http://bundler.io/)
- in project path type `bundle install` to install gems from [Gemfile](https://github.com/pdaw/brancher/blob/master/Gemfile)
- create `config.yml` basing on `config.yml.dist`

#### Start:
- type `rake` in console

