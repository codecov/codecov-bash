Codecov Global Uploader
=======================
> Upload reports to Codecov for almost every supported languages.

------

```bash
bash <(curl -s https://codecov.io/bash)
```

------

### Languages
> [C#/.net](https://github.com/codecov/example-csharp), [C/C++](https://github.com/codecov/example-c), [D](https://github.com/codecov/example-d), [Go](https://github.com/codecov/example-go), [Groovy](https://github.com/codecov/example-groovy), [Java](https://github.com/codecov/example-java), [Kotlin](https://github.com/codecov/example-kotlin), [Node/Javascript/Coffee](https://github.com/codecov/example-node), [PHP](https://github.com/codecov/example-php), [Python](https://github.com/codecov/example-python), [R](https://github.com/codecov/example-r), [Scala](https://github.com/codecov/example-scala), [Xtern](https://github.com/codecov/example-xtend), [Xcode](https://github.com/codecov/example-xcode) and more...


### Usage

|         Argument        |                                                                    Description                                                                     |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-t` or `CODECOV_TOKEN` | Private repo token for uploading                                                                                                                   |
| `-e` or `CODECOV_ENV`   | List of config vars to store for the build [see example](https://codecov.io/github/pyca/cryptography?ref=d47946f3d3e358b706e996d0b951d496ffc2461f) |
| `-u` or `CODECOV_URL`   | **Enterprise** url of your instance of Codecov                                                                                                     |
| `-r` or `CODECOV_SLUG`  | **Enterprise** repository slug ex. "owner/repo"                                                                                                    |

```yaml
# .travis.yml example
after_success:
  # ex. public repo
  - bash <(curl -s https://codecov.io/bash)
  # ex. private repo
  - bash <(curl -s https://codecov.io/bash) -t :repo-token
  # ex. w/ environment variables
  - bash <(curl -s https://codecov.io/bash) -e TOX_ENV,CUSTOM_VAR
  # ex. Enterprise
  - bash <(curl -s https://codecov.io/bash) -u https://my-codecov.com -r company/awesome-repo
```


### CI Providers
|                       Company                       |                                                               Supported                                                               | Tokens Required  |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| [Travis CI](https://travis-ci.org/)                 | Yes [![Build Status](https://secure.travis-ci.org/codecov/codecov-bash.svg?branch=master)](http://travis-ci.org/codecov/codecov-bash) | Private only     |
| [CircleCI](https://circleci.com/)                   | Yes [![Circle CI](https://img.shields.io/circleci/project/codecov/codecov-bash.svg)](https://circleci.com/gh/codecov/codecov-bash)    | Private only     |
| [Codeship](https://codeship.com/)                   | Yes                                                                                                                                   | Public & Private |
| [Jenkins](https://jenkins-ci.org/)                  | Yes                                                                                                                                   | Public & Private |
| [Semaphore](https://semaphoreci.com/)               | Yes                                                                                                                                   | Public & Private |
| [drone.io](https://drone.io/)                       | Yes                                                                                                                                   | Public & Private |
| [AppVeyor](http://www.appveyor.com/)                | Yes                                                                                                                                   | Public & Private |
| [Wercker](http://wercker.com/)                      | Yes                                                                                                                                   | Public & Private |
| [Magnum CI](https://magnum-ci.com/)                 | Yes                                                                                                                                   | Public & Private |
| [Shippable](http://www.shippable.com/)              | Yes                                                                                                                                   | Public & Private |
| [Gitlab CI](https://about.gitlab.com/gitlab-ci/)    | Yes                                                                                                                                   | Public & Private |
| [snap ci](https://snap-ci.com_)                     | Yes                                                                                                                                   | Public & Private |
| git                                                 | Yes (as a fallback)                                                                                                                   | Public & Private |
| [Buildbot](http://buildbot.net/)                    | `coming soon` [buildbot/buildbot#1671](https://github.com/buildbot/buildbot/pull/1671)                                                |                  |
| [Bamboo](https://www.atlassian.com/software/bamboo) | `coming soon`                                                                                                                         |                  |
| [Solano Labs](https://www.solanolabs.com/)          | `coming soon`                                                                                                                         |                  |

> Using **Travis CI**? Uploader is compatable with `sudo: false` which can speed up your builds. :+1:

