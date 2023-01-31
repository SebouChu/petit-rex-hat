# Setup Dokku

TODO

## Eléments

```
dokku nginx:set petit-rex-hat x-forwarded-ssl on
dokku nginx:set petit-rex-hat x-forwarded-for-value "\$http_x_forwarded_for"
dokku nginx:set petit-rex-hat x-forwarded-port-value "\$http_x_forwarded_port"
dokku nginx:set petit-rex-hat x-forwarded-proto-value "https"
```