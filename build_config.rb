MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end
  # toolchain :clang

  enable_debug

  # Use mrbgems
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :github => 'masuidrive/mrbgems-example', :checksum_hash => '76518e8aecd131d047378448ac8055fa29d974a9'
  # conf.gem :git => 'git@github.com:masuidrive/mrbgems-example.git', :branch => 'master', :options => '-v'

  # ============================================================================
  # custom mrbgems
  # mruby-polarssl
  conf.gem github: 'iij/mruby-io'
  conf.gem github: 'iij/mruby-socket'
  conf.gem github: 'iij/mruby-mtest'
  # conf.gem github: 'luisbebop/mruby-polarssl'

  conf.gem github: 'iij/mruby-digest'

  # conf.gem github: 'mattn/mruby-curl'

  # conf.gem github: 'FlowerWrong/mruby-crypto'
  # conf.cc.include_paths << '/usr/local/opt/openssl/include'
  # conf.linker.library_paths << '/usr/local/opt/openssl/lib'
  # # conf.linker.flags << '-L/usr/local/opt/openssl/lib -lcrypto -lz'
  # conf.linker.libraries << 'crypto'

  # mruby-secure-random
  conf.gem github: 'iij/mruby-pack'
  conf.gem github: 'monochromegane/mruby-secure-random'

  # mruby-require
  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-tempfile'
  conf.gem github: 'iij/mruby-require'

  # mruby-libuv
  # conf.cc.flags << '-DMRB_INT64'
  conf.gem github: 'jbreeden/mruby-libuv'
  conf.cc.flags << `pkg-config libuv --cflags`.strip
  conf.linker.flags << `pkg-config libuv --libs`.strip

  # ============================================================================

  # include the default GEMs
  conf.gembox 'default'
end
