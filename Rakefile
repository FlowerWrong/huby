require 'fileutils'

task default: %w[build_mruby]

task :build_mruby do
  mv('./mruby/build_config.rb', './build_config_copy.rb')
  cp('./build_config.rb', './mruby/build_config.rb')
  cd 'mruby'
  sh 'ls'
  sh 'make'
  rm './build_config.rb'
  cd '..'
  mv('./build_config_copy.rb', './mruby/build_config.rb')
end
