Codecov Global Uploader
=======================
[![codecov](https://codecov.io/gh/codecov/codecov-bash/branch/master/graph/badge.svg?token=iEvSTnW9Qm)](https://codecov.io/gh/codecov/codecov-bash)

> Upload reports to Codecov for almost every supported language.

[Deployed Version](https://codecov.io/bash)

------

```bash
# Download script and verify integrity
curl -Ls https://codecov.io/bash > codecov.sh && \
  echo "89c658e261d5f25533598a222fd96cf17a5fa0eb3772f2defac754d9970b2ec8 codecov.sh" | sha256sum --check --quiet && \
  chmod +x ./codecov.sh && \
  ./codecov.sh
```

------

### Languages
> Codecov supports many languages, you can find a full list here: https://docs.codecov.io/docs/supported-languages


### Usage
> Below are most commonly used settings. [View full list of commands](https://github.com/codecov/codecov-bash/blob/master/codecov#L56) to see the full list of commands.

```yaml
# public repo on Travis CI
after_success:
  - curl -Ls https://codecov.io/bash > codecov.sh
  - echo "89c658e261d5f25533598a222fd96cf17a5fa0eb3772f2defac754d9970b2ec8 codecov.sh" | sha256sum --check --quiet
  - chmod +x ./codecov.sh
  - ./codecov.sh
```

```yaml
# private repo
after_success:
  - curl -Ls https://codecov.io/bash > codecov.sh
  - echo "89c658e261d5f25533598a222fd96cf17a5fa0eb3772f2defac754d9970b2ec8 codecov.sh" | sha256sum --check --quiet
  - chmod +x ./codecov.sh
  - ./codecov.sh -t your-repository-upload-token
```

```yaml
# Flag build types
after_success:
  - curl -Ls https://codecov.io/bash > codecov.sh
  - echo "89c658e261d5f25533598a222fd96cf17a5fa0eb3772f2defac754d9970b2ec8 codecov.sh" | sha256sum --check --quiet
  - chmod +x ./codecov.sh
  - ./codecov.sh -F unittests
```

```yaml
# Include environment variables to store per build
after_success:
  - bash <(curl -s https://codecov.io/bash) -e TOX_ENV,CUSTOM_VAR
```

> When running the codecov-bash uploader on Alpine Linux, you are likely to run into a parsing issue because of the default shell. To be able to upload reports, you need to issue the following commands.

```yaml
after_success:
  - apk -U add git curl bash findutils
  - curl -Ls https://codecov.io/bash > codecov.sh
  - echo "89c658e261d5f25533598a222fd96cf17a5fa0eb3772f2defac754d9970b2ec8 codecov.sh" | sha256sum --check --quiet
  - chmod +x ./codecov.sh
  - ./codecov.sh -F unittests
```

### Prevent build failures
If Codecov fails to upload reports, you can ensure the CI build does not fail by adding a catch-all:

```
bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"
```


### CI Providers

|                       Company                       |                                                                    Supported                                                                     | Token Required   |
|:---------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------:|:----------------:|
| [Travis CI](https://travis-ci.org/)                 | Yes [![Build Status](https://secure.travis-ci.org/codecov/codecov-bash.svg?branch=master)](http://travis-ci.org/codecov/codecov-bash) [![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fcodecov-bash.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fcodecov-bash?ref=badge_shield) | Private only |
| [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/pipelines/) | Yes | Private only |
| [CircleCI](https://circleci.com/)                   | Yes | Private only     |
| [Codeship](https://codeship.com/)                   | Yes | Public & Private |
| [Jenkins](https://jenkins-ci.org/)                  | Yes | Public & Private |
| [Semaphore](https://semaphoreci.com/)               | Yes | Public & Private |
| [TeamCity](https://www.jetbrains.com/teamcity/).    | Yes | Public & Private |
| [drone.io](https://drone.io/)                       | Yes | Public & Private |
| [AppVeyor](http://www.appveyor.com/)                | Yes | Private only     |
| [Bamboo](https://www.atlassian.com/software/bamboo) | Yes | Public & Private |
| [Bitbucket](https://bitbucket.org/product/features/pipelines) | Yes | Public & Private |
| [Bitrise](https://bitrise.io/)                      | Yes | Public & Private |
| [buddybuild](https://buddybuild.com)                | Yes | Public & Private |
| [Buildkite](https://buildkite.com)                  | Yes | Public & Private |
| [Heroku](https://heroku.com)                        | Yes | Public & Private |
| [Wercker](http://wercker.com/)                      | Yes | Public & Private |
| [Shippable](http://www.shippable.com/)              | Yes | Public & Private |
| [Gitlab CI](https://about.gitlab.com/gitlab-ci/)    | Yes | Public & Private |
| [Buildkite](https://buildkite.com)                  | Yes | Public & Private |
| [GitHub Actions](https://github.com/features/actions) | Yes | Private only |
| [Cirrus CI](https://cirrus-ci.org/)                 | Yes | Public & Private |
| [AWS CodeBuild](https://aws.amazon.com/codebuild/)  | Yes | Public & Private |
| git                                                 | Yes (as a fallback) | Public & Private |


### Caveats

1. **Jenkins**: Unable to find reports? Try `PWD=WORKSPACE bash <(curl -s https://codecov.io/bash)`


### Development

To automatically update the hash files after a change to the Codecov uploader script, run

```
./install.sh
```

which will add the `pre-commit` hooks. You can also update the hash files manually via:

```bash
for i in 1 256 512; do shasum -a "${i}" codecov > "SHA${i}SUM"; done
```

and add the change to your pull request.


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fcodecov-bash.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fcodecov-bash?ref=badge_large)
