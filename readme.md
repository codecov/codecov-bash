Codecov Global Uploader
=======================

[![Circle CI](https://img.shields.io/circleci/project/codecov/codecov-bash.svg)](https://circleci.com/gh/codecov/codecov-bash)

> Upload reports to Codecov for all supported languages.


### Simply

```yaml
after_success:
  - bash <(curl -s https://codecov.io/bash)
```
> Using Travis CI? Settings `sudo: false` may speed up your builds and still works with this uploader.

### CI Companies Supported
Jenkins, Travis CI, Codeship, Circle CI, Semaphore, drone.io, AppVeyor, Wercker, Magnum, Shippable, and Gitlab CI. Otherwise fallbacks on `git`.


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
