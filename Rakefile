require 'fileutils'

task default: %w[build_libuv]

task :build_libuv do
  cd 'libuv'
  rm_rf 'build'
  sh 'git clone https://chromium.googlesource.com/external/gyp.git build/gyp'
  sh './gyp_uv.py -f xcode'
  sh 'xcodebuild -ARCHS="x86_64" -project uv.xcodeproj -configuration Release -target All'
  rm('.DS_Store', force: true)
  rm('build/.DS_Store', force: true)
  cd '..'
end

task :build_openssl do
  cd 'openssl'
  sh './Configure darwin64-x86_64-cc'
  sh 'make'
  cd '..'
end

task :build_curl do
  cd 'curl'
  sh './buildconf'
  sh './configure --with-darwinssl'
  sh 'make'
  # sh 'make test'
  cd '..'
end

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
