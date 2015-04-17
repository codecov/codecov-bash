Universal Codecov Uploader

> Bash method to upload reports to Codecov for all supported languages.

----

> Coming soon. Pre-beta. Not prodution ready. Thanks!

----

### Simply

```yaml
after_success:
    - bash <(curl -s https://codecov.io/bash)
```

### Enterprise

```yaml
after_success:
    - curl -s https://codecov.io/bash | bash /dev/stdin -u https://custom-site.com/
```
