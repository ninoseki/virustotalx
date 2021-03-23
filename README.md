# virustotalx

[![Gem Version](https://badge.fury.io/rb/virustotalx.svg)](https://badge.fury.io/rb/virustotalx)
[![Ruby CI](https://github.com/ninoseki/virustotalx/actions/workflows/test.yml/badge.svg)](https://github.com/ninoseki/virustotalx/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/virustotalx/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/virustotalx?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/virustotalx/badge)](https://www.codefactor.io/repository/github/ninoseki/virustotalx)

Yet another VirusTotal API (version 3) wrapper for Ruby.

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
api.file.get(hash)
api.file.upload("/tmp/test.txt")

api.url.get("http://github.com")
api.url.analyse("https://github.com/ninoseki/virustotalx")

api.domain.get("github.com")

api.ip_address.get("1.1.1.1")
```

## Supported API endpoints

- [VirusTotal API reference](https://developers.virustotal.com/v3.0/reference#overview)

### Files

| HTTP Method | URL                                | API method                                                 |
|-------------|------------------------------------|------------------------------------------------------------|
| POST        | /files                             | api.file.upload(filepath)                                  |
| GET         | /files/upload_url                  | api.file.upload_url                                        |
| GET         | /files/{id}                        | api.file.get(id)                                           |
| POST        | /files                             | api.file.upload(path)                                      |
| POST        | /files/{id}/analyse                | api.file.analyse(id)                                       |
| GET         | /files/{id}/comments               | api.file.comments(id)                                      |
| POST        | /files/{id}/comments               | api.file.add_comment(id, text)                             |
| GET         | /files/{id}/votes                  | api.file.votes(id)                                         |
| POST        | /files/{id}/votes                  | api.file.add_vote(id, verdict)                             |
| GET         | /files/{id}/download_url           | api.file.downbload_url(id)                                 |
| GET         | /files/{id}/download               | api.file.download(id)                                      |
| GET         | /files/{id}/{relationship}         | api.file.`relationship`(id) (e.g. api.file.behaviours(id)) |
| GET         | /file_behaviours/{sandbox_id}/pcap | api.file.pcap(sandbox_id)                                  |

### URLs

| HTTP Method | URL                         | API method                                                     |
|-------------|-----------------------------|----------------------------------------------------------------|
| POST        | /urls                       | N/A                                                            |
| GET         | /urls/{id}                  | api.url.get(id)                                                |
| POST        | /urls/{id}/analyse          | api.url.analyse(id)                                            |
| GET         | /urls/{id}/comments         | api.url.comments(id)                                           |
| POST        | /urls/{id}/comments         | api.url.add_comment(id)                                        |
| GET         | /urls/{id}/votes            | api.url.votes(id)                                              |
| POST        | /urls/{id}/votes            | api.url.add_vote(id, text)                                     |
| GET         | /urls/{id}/network_location | api.url.network_location(id)                                   |
| GET         | /urls/{id}/{relationship}   | api.url.`relationship`(id) (e.g. api.url.downloaded_files(id)) |

Note: you can use a URL as an id.

### Domains

| HTTP Method | URL                              | API method                                                   |
|-------------|----------------------------------|--------------------------------------------------------------|
| GET         | /domains/{domain}                | api.domain.get(domain)                                       |
| GET         | /domains/{domain}/comments       | api.domain.comment(domain)                                   |
| POST        | /domains/{domain}/comments       | api.domain.add_comment(domain, text)                         |
| GET         | /domains/{domain}/{relationship} | api.domain.`relationship`(domain) (e.g. api.domain.(domain)) |

### IP addresses

| HTTP Method | URL                               | API method                                                                      |
|-------------|-----------------------------------|---------------------------------------------------------------------------------|
| GET         | /ip_addresses/{ip}                | api.ip_address.get(ip)                                                          |
| GET         | /ip_addresses/{ip}/comments       | api.ip_address.comments(id)                                                     |
| POST        | /ip_addresses/{ip}/comments       | api.ip_address.add_comment(id, text)                                            |
| GET         | /ip_addresses/{ip}/{relationship} | api.ip_address.`relationship`(id) (e.g. api.ip_address.communicating_files(ip)) |

### Analyses

| HTTP Method | URL            | API method           |
|-------------|----------------|----------------------|
| GET         | /analyses/{id} | api.analysis.get(ip) |

## Graphs

| HTTP Method | URL                                                  | API method                                                                          |
|-------------|------------------------------------------------------|-------------------------------------------------------------------------------------|
| GET         | graphs                                               | api.graph.search(filter: nil, limit: nil, cursor: nil, order: nil, attributes: nil) |
| POST        | graphs                                               | api.graph.create(\*\*params)                                                        |
| GET         | graphs/{id}                                          | api.graph.get(id)                                                                   |
| PATCH       | graphs/{id}                                          | api.graph.update(id, \*\*params)                                                    |
| GET         | graphs/{id}/relationships/viewers                    | api.graph.viewers(id, limit: nil, cursor: nil)                                      |
| POST        | graphs/{id}/relationships/viewers                    | api.graph.add_viewer(id, \*\*params)                                                |
| GET         | graphs/{id}/relationships/viewers/{user_or_group_id} | api.graph.check_viewer(id, user_or_group_id)                                        |
| DELETE      | graphs/{id}/relationships/viewers/{user_or_group_id} | api.graph.delete_viewer(id, user_or_group_id)                                       |
| GET         | graphs/{id}/relationships/editors                    | api.graph.editors(id, limit: nil, cursor: nil)                                      |
| POST        | graphs/{id}/relationships/editors                    | api.graph.add_editor(id, \*\*params)                                                |
| GET         | graphs/{id}/relationships/editors/{user_or_group_id} | api.graph.check_editor(id, user_or_group_id)                                        |
| DELETE      | graphs/{id}/relationships/editors/{user_or_group_id} | api.graph.delete_editor(id, user_or_group_id)                                       |
| GET         | graphs/{id}/relationships/{relationship}             | api.graph.`relationship`(id)                                                        |

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
