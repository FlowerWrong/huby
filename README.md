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

* [ ] openssl for mruby
* [ ] mruby engine
* [ ] extension system

## Used mrubygems

* [mruby-libuv](https://github.com/jbreeden/mruby-libuv)
* [mruby-polarssl](https://github.com/luisbebop/mruby-polarssl)
* [mruby-require](https://github.com/iij/mruby-require)
* [mruby-secure-random](https://github.com/monochromegane/mruby-secure-random)

## References

* [mruby libraries](http://mruby.org/libraries/)
