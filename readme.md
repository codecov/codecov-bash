Codecov Global Uploader
=======================
> Upload reports to Codecov for all supported languages.


### Simply

```yaml
after_success:
  - bash <(curl -s https://codecov.io/bash)
```
> Using Travis CI? Settings `sudo: false` may speed up your builds and still works with this uploader.

### CI Companies Supported
|                     Company                      |   Supported   |                                                               Tests                                                               |
| ------------------------------------------------ | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [Travis CI](https://travis-ci.org/)              | Yes           | [![Build Status](https://secure.travis-ci.org/codecov/codecov-bash.svg?branch=master)](http://travis-ci.org/codecov/codecov-bash) |
| [CircleCI](https://circleci.com/)                | Yes           | [![Circle CI](https://img.shields.io/circleci/project/codecov/codecov-bash.svg)](https://circleci.com/gh/codecov/codecov-bash)    |
| [Codeship](https://codeship.com/)                | Yes           |                                                                                                                                   |
| [Jenkins](https://jenkins-ci.org/)               | Yes           |                                                                                                                                   |
| [Semaphore](https://semaphoreci.com/)            | Yes           |                                                                                                                                   |
| [drone.io](https://drone.io/)                    | Yes           |                                                                                                                                   |
| [AppVeyor](http://www.appveyor.com/)             | Yes           |                                                                                                                                   |
| [Wercker](http://wercker.com/)                   | Yes           |                                                                                                                                   |
| [Magnum CI](https://magnum-ci.com/)              | Yes           | [![Build Status](https://magnum-ci.com/status/3b0c7f8c38439654750c09fae9db5dd9.png)](https://magnum-ci.com/projects/2797)         |
| [Shippable](http://www.shippable.com/)           | Yes           |                                                                                                                                   |
| [Gitlab CI](https://about.gitlab.com/gitlab-ci/) | Yes           |                                                                                                                                   |
| [Buildbot](http://buildbot.net/)                 | `coming soon` |                                                                                                                                   |
| [snap ci](https://snap-ci.com_)                  | `coming soon` |                                                                                                                                   |
| [Solano Labs](https://www.solanolabs.com/)       | `coming soon` |                                                                                                                                   |
| git                                              | Yes           |                                                                                                                                   |


### More Options

```
CODECOV_TOKEN   Private repo token for uploading
CODECOV_ENV     List of config vars that are stored for this build
CODECOV_URL     Enterprise url
CODECOV_SLUG    Repository slug (ex "owner/repo") used in Enterprise instead of private repo token
```

```yaml
env:
  global:
    - CODECOV_TOKEN=9dcefbad-1cef-4895-8fb7-a90cf4737904
    - CODECOV_ENV=KEEP,THESE,ENV,VALUES
    - CODECOV_URL=https://your-enterprise.com
    - CODECOV_SLUG=myteam/myrepo

after_success:
  - bash <(curl -s https://codecov.io/bash)
```

#### One line

```yaml
after_success:
  - curl -s https://codecov.io/bash | bash /dev/stdin -t 15482e9c-3612-4812-b19b-f5e79139dfe3
```
