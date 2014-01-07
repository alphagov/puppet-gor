# gor

Puppet module for [Gor](https://github.com/buger/gor/).

Installs Gor, configures an upstart job with the appropriate arguments, and
starts the service. You will need to provide your own `gor` package.

## Example usage

Pass some arguments:
```puppet
class { 'gor':
  args => {
    '-input-raw'          => 'localhost:7999',
    '-output-http-header' => 'User-Agent: gor',
    '-output-http'        => 'https://staging.example.com',
  },
}
```

To install a specific version of the Gor package:
```puppet
class { 'gor':
  package_ensure => '1.2.3',
  …
}
```

## License

See [LICENSE](LICENSE) file.
