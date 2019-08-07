# virustotalx

[![Gem Version](https://badge.fury.io/rb/virustotalx.svg)](https://badge.fury.io/rb/virustotalx)
[![Build Status](https://travis-ci.org/ninoseki/virustotalx.svg?branch=master)](https://travis-ci.org/ninoseki/virustotalx)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/virustotalx/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/virustotalx?branch=master)

Yet another VirusTotal API wrapper for Ruby

## Installation

```bash
gem install virustotalx
```

## Usage

```ruby
require "virustotalx"
# or
require "virustotal"

# when given nothing, it tries to load your API key from ENV["VIRUSTOAL_API_KEY"]
api = VirusTotal::API.new
# or you can set it manually
api = VirusTotal::API.new(key: "YOUR_API_KEY")

hash = "726a2eedb9df3d63ec1b4a7d774a799901f1a2b9"
api.file.report(hash)
api.file.scan("PAHT_TO_FILE")
api.file.rescan(hash)
api.file.upload_url
api.file.download(hash)
api.file.behaviour(hash)
api.file.network_traffic(hash)
api.file.clusters("DATETIME")
api.file.search("resource:#{hash}")

api.url.report("http://github.com")
api.url.scan("https://github.com/ninoseki/virustotalx")

api.domain.report("github.com")

api.ip_address.report("1.1.1.1")

# it returns nil when given a non-existing resource to #report methods
api.domain.report("a_domain_which_does_not_exist.com")
# => nil
```

See `/spec/clients` for more.

## Supported API endpoints

* [VirusTotal API reference](https://developers.virustotal.com/reference)

| HTTP Method | URL                   | Public / Private | API method                                                |
|-------------|-----------------------|------------------|-----------------------------------------------------------|
| GET         | /file/report          | Public           | `VirusTotal::Client::File#report(resource, allinfo: nil)` |
| POST        | /file/scan            | Public           | `VirusTotal::Client::File#scan(path)`                     |
| GET         | /file/scan/upload_url | Private          | `VirusTotal::Client::File#upload_url`                     |
| POST        | /file/rescan          | Public           | `VirusTotal::Client::File#rescan(resource)`               |
| GET         | /file/download        | Private          | `VirusTotal::Client::File#download(hash)`                 |
| GET         | /file/behaviour       | Private          | `VirusTotal::Client::File#behaviour(hash)`                |
| GET         | /file/network-traffic | Private          | `VirusTotal::Client::File#network_traffic(hash)`          |
| GET         | /file/feed            | Private          | N/A                                                       |
| GET         | /file/clusters        | Private          | `VirusTotal::Client::File#clusters(date)`                 |
| GET         | /file/search          | Private          | `VirusTotal::Client::File#search(query, offset: nil)`     |
| GET         | /url/report           | Public           | `VirusTotal::Client::URL#report(resource, allinfo: nil)`  |
| POST        | /url/scan             | Public           | `VirusTotal::Client::URL#scan(url)`                       |
| GET         | /url/feed             | Private          | N/A                                                       |
| GET         | /domain/report        | Public           | `VirusTotal::Client::Domain#report(domain)`               |
| GET         | /ip-address/report    | Public           | `VirusTotal::Client::IPAddress(ip)`                       |
| GET         | /comments/            | Public           | N/A                                                       |
| POST        | /comments/put         | Public           | N/A                                                       |

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
