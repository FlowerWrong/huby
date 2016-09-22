# README

## Install

```bash
git submodule init
git submodule init

git submodule foreach git pull

cd mruby
make test

vim ~/demo.rb
```

### demo.rb

```ruby
puts "hello world form demo.rb"
MyModule.my_c_method('NSAlert')
```

## TODO

* [ ] mruby engine
