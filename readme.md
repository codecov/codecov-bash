## ⚠️ Deprecation Warning ⚠️

**On February 1, 2022, this uploader will be fully sunset and no longer function**

We recommend all users migrate to the [uploader](https://github.com/codecov/uploader) to prevent any breakages in usage. You can learn more about our deprecation plan and the new uploader on our [blog](https://about.codecov.io/blog/introducing-codecovs-new-uploader/).

-----

Codecov Bash Uploader
=======================
### Upload reports to Codecov for almost every supported language.
[![codecov](https://codecov.io/gh/codecov/codecov-bash/branch/master/graph/badge.svg?token=iEvSTnW9Qm)](https://codecov.io/gh/codecov/codecov-bash)

[Deployed Version](https://codecov.io/bash)

## Running the bash uploader

-----
```bash
# All CI
bash <(curl -s https://codecov.io/bash)
 
# Pipe to bash (Jenkins)
curl -s https://codecov.io/bash | bash -s - -t token
#                                           ^ add your extra config here

# No bash method
curl -s https://codecov.io/bash > .codecov
chmod +x .codecov
./.codecov
```
-----

#### ⚠️ Verifying the bash uploader
As an additional layer of security, users may wish to check the script against the provided SHASUMs.

```bash
curl -fLso codecov https://codecov.io/bash;
VERSION=$(grep -o 'VERSION=\"[0-9\.]*\"' codecov | cut -d'"' -f2);
for i in 1 256 512
do
  shasum -a $i -c --ignore-missing <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM")
done
./codecov
```

or for older versions of `shasum`

```bash
curl -fLso codecov https://codecov.io/bash;
VERSION=$(grep -o 'VERSION=\"[0-9\.]*\"' codecov | cut -d'"' -f2);
for i in 1 256 512
do
  shasum -a $i -c <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM" | grep -w "codecov")
done
./codecov
```

### Languages
> Codecov supports many languages, you can find a full list here: https://docs.codecov.io/docs/supported-languages


### Other Usage
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

> When running the codecov-bash uploader on Alpine Linux, you are likely to run into a parsing issue because of the default shell. To be able to upload reports, you need to issue the following commands.

```yaml
after_success:
  - apk -U add git curl bash findutils
  - bash -c '/bin/bash <(curl -s https://codecov.io/bash)'
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
