Codecov Global Uploader
=======================

> Upload reports to Codecov for all supported languages.


----

> Coming soon. Pre-beta. Not prodution ready. Thanks!

----


### Simply

```yaml
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

### More Options

```
CODECOV_TOKEN   Private repo token for uploading
CODECOV_URL     Enterprise url
CODECOV_ENV     List of config vars that are stored for this build
```

```yaml
env:
  - CODECOV_TOKEN=9dcefbad-1cef-4895-8fb7-a90cf4737904
  - CODECOV_URL=https://your-enterprise.com
  - CODECOV_ENV=KEEP,THESE,ENV,VALUES
after_success:
  - bash <(curl -s https://codecov.io/bash)
```
