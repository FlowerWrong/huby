# README

## Install

```bash
git submodule init
git submodule init

git submodule foreach git pull

# build mruby
rake build_libuv
rake build_mruby

vim ~/demo.rb
```

### demo.rb

```ruby
puts "hello world form demo.rb"
MyModule.my_c_method('NSAlert')
```

## TODO

* [ ] mruby engine
* [ ] extension system

## References

* [mruby libraries](http://mruby.org/libraries/)
