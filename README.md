### Hexlet tests and linter status:
[![Actions Status](https://github.com/Diopus/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/Diopus/rails-project-lvl1/actions)

[![CI](https://github.com/Diopus/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/Diopus/rails-project-lvl1/actions/workflows/main.yml)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage
### Object
Method **form_for** allows you to create the form structure based on HTML. Method takes ROPO (Ruby Old Plain Object) as an input. These ROPOs are built using _Struct_:
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'
```
### Default Input field
You can build simple _<input>_ field with an auto-given name and default type `text`. A _<label>_ will be created as well.
```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
end
```
=>
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text">
  <label for="job">Job</label>                                           
  <input name="job" type="text" value="hexlet">  
</form>
```
Input `name` was correctly created even though it was declared only in _User_ class and not in the _user_ object.

### Textarea
You can build _<textarea>_ with an auto-given name using option `as: :text`. Size can be set via `cols:` and `rows:` options (defaults are **20** and **40**).
```ruby
HexletCode.form_for user do |f|
  f.input :name, as: :text
end
```
=>
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <textarea cols="20" rows="40" name="name"></textarea>      
</form>
```
### Submit
You can build _<input>_ with type `submit` using instance method **submit**. Default `value="Save"`.
```ruby
HexletCode.form_for user do |f|
  f.submit
end
```
=>
```html
<form action="#" method="post">
  <input name="commit" type="submit" value="Save" >      
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
