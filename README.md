# Introduction about ToFile

This gem is aim to transform the format of objects to be suitable for exporting , and export them into specific files. </br>

Currently supported export files: </br>
* YAML

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_file'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_file

## Usage

It's very easy to use and the common usage is: <br />

```ruby
ToFile::To.NAME_OF_FILE(object, export_path = './exaple.FILE_TYPE', confirmation = true)
```

Some explanation about the parameters: <br />

* `object`:                 The ruby object which you want to export into files.
* `export_path`(optional):  The path where you want to generate your export file. Default will be './example.FILE_TYPE' such as './example.yml'
* `confirmation`(optional): To confirm if you want to overwrite the existing file from export_path.

## Here are some samples:

* --start-- YAML --start--

```ruby
require 'to_file'

a = [1,2,3]
ToFile::To.yml(a, './test/a.yml', false)
```

* --end-- YAML --end--

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/demaciaYu/to_file.
