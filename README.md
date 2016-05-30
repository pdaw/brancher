Simple Ruby pet project created to simplify manual testing of software on many git repositories for my team :)

#### Functionalities:
- Checking out branches of many repositories (pull if you already are)
- Uploading files (except blacklisted, for example vendor)
- Invoking remote commands (for example in order to cleaning cache)

#### Dependencies:
- [Ruby 2.3 + RubyGems](http://rubyinstaller.org/downloads/)
- [Git](https://git-scm.com/downloads)

#### Recommendations:
- [ssh-agent](https://confluence.atlassian.com/bitbucket/my-gitbash-ssh-environment-always-asks-for-my-passphrase-what-can-i-do-277252540.html)

#### Installation:
- enter `gem install bundler` to install [bundler](http://bundler.io/)
- in project path type `bundle install` to install gems from [Gemfile](https://github.com/pdaw/brancher/blob/master/Gemfile)
- create `config.yml` basing on `config.yml.dist`

#### Start:
- type `rake` in console

