Codecov Global Uploader
=======================
> Upload reports to Codecov for almost every supported language.

[![Deployed Version](https://codecov.io?bash=badge)](https://codecov.io?bash=redirect)

------

```bash
# All CI
bash <(curl -s https://codecov.io/bash)

# Pipe to bash (Jenkins)
curl -s https://codecov.io/bash | bash -s - -t token
                                            ^ add your extra config here

# No bash method
curl -s https://codecov.io/bash > .codecov
chmod +x .codecov
./.codecov
```

------

### Languages
> [Python](https://github.com/codecov/example-python), [C#/.net](https://github.com/codecov/example-csharp), [Java](https://github.com/codecov/example-java), [Node/Javascript/Coffee](https://github.com/codecov/example-node),
> [C/C++](https://github.com/codecov/example-c), [D](https://github.com/codecov/example-d), [Go](https://github.com/codecov/example-go), [Groovy](https://github.com/codecov/example-groovy), [Kotlin](https://github.com/codecov/example-kotlin),
> [PHP](https://github.com/codecov/example-php), [R](https://github.com/codecov/example-r), [Scala](https://github.com/codecov/example-scala), [Xtern](https://github.com/codecov/example-xtend), [Xcode](https://github.com/codecov/example-xcode), [Lua](https://github.com/codecov/example-lua) and more...


### Usage
> Below are most commonly used settings. [View full list of commands](https://github.com/codecov/codecov-bash/blob/master/codecov#L56) to see the full list of commands.

```yaml
# public repo on Travis CI
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

```yaml
# private repo
after_success:
  - bash <(curl -s https://codecov.io/bash) -t your-repository-upload-token
```

```yaml
# Flag build types
after_success:
  - bash <(curl -s https://codecov.io/bash) -F unittests
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
| [AppVeyor](http://www.appveyor.com/)                | No. See [Codecov Python](https://github.com/codecov/codecov-python).                                                                             | Private only     |
| [Wercker](http://wercker.com/)                      | Yes                                                                                                                                              | Public & Private |
| [Magnum CI](https://magnum-ci.com/)                 | Yes                                                                                                                                              | Public & Private |
| [Shippable](http://www.shippable.com/)              | Yes                                                                                                                                              | Public & Private |
| [Gitlab CI](https://about.gitlab.com/gitlab-ci/)    | Yes                                                                                                                                              | Public & Private |
| git                                                 | Yes (as a fallback)                                                                                                                              | Public & Private |
| [Buildbot](http://buildbot.net/)                    | `coming soon` [buildbot/buildbot#1671](https://github.com/buildbot/buildbot/pull/1671)                                                           |                  |
| [Bamboo](https://www.atlassian.com/software/bamboo) | `coming soon`                                                                                                                                    |                  |
| [Solano Labs](https://www.solanolabs.com/)          | `coming soon`                                                                                                                                    |                  |
| [Bitrise](https://bitrise.io/)                      | `coming soon`                                                                                                                                    |                  |

> Using **Travis CI**? Uploader is compatible with `sudo: false` which can speed up your builds. :+1:


## Caveat

1. **Jenkins**: Unable to find reports? Try `PWD=WORKSPACE bash <(curl -s https://codecov.io/bash)`
  - Please let us know if this works for you. More at #112
