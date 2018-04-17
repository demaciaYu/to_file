# Introduction about ToFile

This gem is aim to transform the format of objects to be suitable for exporting , and export them into specific files. It's super easy to extend data type which supported by ruby but not in this gem.</br>

Currently supported export files: </br>
* `YAML`
* `JSON`
* `XML`

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
ToFile::To.NAME_OF_FILE(object, export_path = './exaple.FILE_TYPE', force_overwrite = false)
```

Some explanation about the parameters: <br />

* `object`:                 The ruby object which you want to export into files. <br />
* `export_path`(optional):  The path where you want to generate your export file. Default will be './example.FILE_TYPE' such as './example.yml' <br />
* `force_overwrite`(optional): This option is ```false``` by default. If you set it to true, it will automaticlly overwrite existing file `without` any interrupt warning. <br />

## Here are some samples:

* YAML

```ruby
require 'to_file'

a = [1,2,3]
ToFile::To.yml(a, './test/a.yml', false)
```

* JSON

```ruby
require 'to_file'

a = {a: 1, b: "hello", c: [1,2,3], d: {e: 1 ,f: "dd"}}
ToFile::To.yml a
```

* XML

```ruby
require 'to_file'

a = {a: 1, b: "hello", c: [1,2,3], d: {e: 1 ,f: "dd"}}
ToFile::To.xml a
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/demaciaYu/to_file.
