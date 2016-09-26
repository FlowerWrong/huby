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
  conf.gem github: 'iij/mruby-digest' # no dependency

  # libffi
  conf.gem "#{root}/mrbgems/mruby-eval"
  conf.gem github: 'fundamental/mruby-cfunc', branch: 'master' do |g|
    g.download_libffi
  end
  conf.gem "#{root}/mrbgems/mruby-struct"
  conf.gem github: 'schmurfy/mruby-rubyffi-compat'

  # conf.gem github: 'mattn/mruby-curl'

  conf.gem github: 'FlowerWrong/mruby-crypto' # no dependency

  # mruby-require
  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-tempfile'
  conf.gem github: 'iij/mruby-require'

  # mruby-libuv
  # conf.cc.flags << '-DMRB_INT64'
  conf.gem github: 'jbreeden/mruby-libuv' # no dependency
  conf.cc.flags << `pkg-config libuv --cflags`.strip
  conf.linker.flags << `pkg-config libuv --libs`.strip

  # ============================================================================

  # include the default GEMs
  conf.gembox 'default'
end
