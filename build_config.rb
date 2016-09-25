MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug

  # ============================================================================
  # custom mrbgems
  # mruby-polarssl
  # conf.gem github: 'iij/mruby-io'
  # conf.gem github: 'iij/mruby-socket'
  # conf.gem github: 'iij/mruby-mtest'
  # conf.gem github: 'luisbebop/mruby-polarssl'

  conf.gem github: 'iij/mruby-digest' # no dependency
  # conf.gem github: 'qtkmz/mruby-digest-ffi'

  # conf.gem github: 'take-cheeze/mruby-cfunc', branch: 'fix_for_latest_2015_05_29' do |g|
  #   # g.use_pkg_config # use pkg-config for libffi linking
  #   g.download_libffi # download and link latest libffi
  #
  #   # if your libffi is installed in a non standard path
  #   # g.cc.include_paths << '[...]/include'
  #   # g.linker.library_paths << '[...]/lib'
  # end

  # conf.gem github: 'mattn/mruby-curl'

  conf.gem github: 'FlowerWrong/mruby-crypto' # no dependency

  # mruby-secure-random
  # conf.gem github: 'iij/mruby-pack'
  # conf.gem github: 'monochromegane/mruby-secure-random'

  # mruby-require
  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-tempfile'
  conf.gem github: 'iij/mruby-require'

  # conf.gem github: 'Asmod4n/mruby-tls'
  # conf.gem github: 'iij/mruby-tls-openssl'

  # mruby-libuv
  # conf.cc.flags << '-DMRB_INT64'
  conf.gem github: 'jbreeden/mruby-libuv' # no dependency
  conf.cc.flags << `pkg-config libuv --cflags`.strip
  conf.linker.flags << `pkg-config libuv --libs`.strip

  # ============================================================================

  # include the default GEMs
  conf.gembox 'default'
end
