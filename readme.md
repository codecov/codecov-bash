Codecov Global Uploader
=======================
> Upload reports to Codecov for almost every supported language.

[![Deployed Version](https://codecov.io/bash?badge=y)](https://codecov.io/bash?redirect=y)

------

> ```bash
bash <(curl -s https://codecov.io/bash)
```

------

### Languages
> [Python](https://github.com/codecov/example-python), [C#/.net](https://github.com/codecov/example-csharp), [Java](https://github.com/codecov/example-java), [Node/Javascript/Coffee](https://github.com/codecov/example-node),
> [C/C++](https://github.com/codecov/example-c), [D](https://github.com/codecov/example-d), [Go](https://github.com/codecov/example-go), [Groovy](https://github.com/codecov/example-groovy), [Kotlin](https://github.com/codecov/example-kotlin),
> [PHP](https://github.com/codecov/example-php), [R](https://github.com/codecov/example-r), [Scala](https://github.com/codecov/example-scala), [Xtern](https://github.com/codecov/example-xtend), [Xcode](https://github.com/codecov/example-xcode), [Lua](https://github.com/codecov/example-lua) and more...


### Usage
> Below are most commonly used settings. [Click here](https://github.com/codecov/codecov-bash/blob/master/codecov#L30-L52) to see the full list of commands.

| Argument |   Environment   |                                                                    Description                                                                     |
| -------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-t`     | `CODECOV_TOKEN` | Private repo token for uploading                                                                                                                   |
| `-e`     | `CODECOV_ENV`   | List of config vars to store for the build [see example](https://codecov.io/github/pyca/cryptography?ref=d47946f3d3e358b706e996d0b951d496ffc2461f) |
| `-u`     | `CODECOV_URL`   | **Enterprise** url of your instance of Codecov                                                                                                     |
| `-r`     | `CODECOV_SLUG`  | **Enterprise** repository slug ex. "owner/repo"                                                                                                    |

```yaml
# public repo on Travis CI
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

```yaml
# private repo
after_success:
  - bash <(curl -s https://codecov.io/bash) -t :repo-token
```

```yaml
# Include environment variables to store per build
after_success:
  - bash <(curl -s https://codecov.io/bash) -e TOX_ENV,CUSTOM_VAR
```


### Prevent build failures
If Codecov fails to upload reports, you can ensure the CI build does not fail by adding a catch-all:

```
bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"
```


### CI Providers
|                       Company                       |                                                                    Supported                                                                     | Token Required   |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| [Travis CI](https://travis-ci.org/)                 | Yes [![Build Status](https://secure.travis-ci.org/codecov/codecov-bash.svg?branch=master)](http://travis-ci.org/codecov/codecov-bash)            | Private only     |
| [CircleCI](https://circleci.com/)                   | Yes [![Circle CI](https://img.shields.io/circleci/project/codecov/codecov-bash.svg?branch=master)](https://circleci.com/gh/codecov/codecov-bash) | Private only     |
| [Codeship](https://codeship.com/)                   | Yes                                                                                                                                              | Public & Private |
| [Jenkins](https://jenkins-ci.org/)                  | Yes                                                                                                                                              | Public & Private |
| [Semaphore](https://semaphoreci.com/)               | Yes                                                                                                                                              | Public & Private |
| [drone.io](https://drone.io/)                       | Yes                                                                                                                                              | Public & Private |
| [AppVeyor](http://www.appveyor.com/)                | No. See [Codecov Python](https://github.com/codecov/codecov-python).                                                                             | Public & Private |
| [Wercker](http://wercker.com/)                      | Yes                                                                                                                                              | Public & Private |
| [Magnum CI](https://magnum-ci.com/)                 | Yes                                                                                                                                              | Public & Private |
| [Shippable](http://www.shippable.com/)              | Yes                                                                                                                                              | Public & Private |
| [Gitlab CI](https://about.gitlab.com/gitlab-ci/)    | Yes                                                                                                                                              | Public & Private |
| [snap ci](https://snap-ci.com_)                     | Yes                                                                                                                                              | Public & Private |
| git                                                 | Yes (as a fallback)                                                                                                                              | Public & Private |
| [Buildbot](http://buildbot.net/)                    | `coming soon` [buildbot/buildbot#1671](https://github.com/buildbot/buildbot/pull/1671)                                                           |                  |
| [Bamboo](https://www.atlassian.com/software/bamboo) | `coming soon`                                                                                                                                    |                  |
| [Solano Labs](https://www.solanolabs.com/)          | `coming soon`                                                                                                                                    |                  |
| [Bitrise](https://bitrise.io/)                      | `coming soon`                                                                                                                                    |                  |

> Using **Travis CI**? Uploader is compatable with `sudo: false` which can speed up your builds. :+1:

