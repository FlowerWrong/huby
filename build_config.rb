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
  conf.gem github: 'iij/mruby-digest' # worked # no dependency
  conf.gem github: 'FlowerWrong/mruby-crypto' # worked # no dependency
  # conf.gem github: 'baldowl/mruby-bcrypt' # FIXME mruby-onig-regexp some big bug
  conf.gem github: 'mattn/mruby-base64' # worked
  conf.gem github: 'mattn/mruby-md5' # worked
  # conf.gem github: 'mattn/mruby-sha1'
  # conf.gem github: 'h2so5/mruby-sha2'
  # conf.gem github: 'Asmod4n/mruby-libsodium' # TODO

  # ============================================================================
  conf.gem github: 'jbreeden/mruby-erb' # worked
  conf.gem github: 'ksss/mruby-file-stat' # worked
  conf.gem github: 'iij/mruby-iijson' # worked
  conf.gem github: 'iij/mruby-ipaddr' # worked
  # conf.gem github: 'carsonmcdonald/mruby-markdown' # TODO
  # conf.gem github: 'kjunichi/mruby-mrmagick' # TODO

  # conf.gem github: 'h2so5/mruby-tinyxml2' # TODO compile failed
  conf.gem github: 'jbreeden/mruby-sqlite' # worked
  conf.gem github: 'AndrewBelt/mruby-yaml' # worked
  # conf.gem github: 'jbreeden/mruby-zlib'

  # ============================================================================
  # mruby-require
  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-tempfile'
  conf.gem github: 'iij/mruby-require' # worked

  conf.gem github: 'iij/mruby-io'
  conf.gem github: 'iij/mruby-pack'
  conf.gem github: 'iij/mruby-socket'
  # conf.gem github: 'mattn/mruby-thread' # TODO

  conf.gem github: 'suzukaze/mruby-msgpack' # worked
  conf.gem github: 'ksss/mruby-ostruct' # worked

  # conf.gem github: 'iij/mruby-regexp-pcre' # TODO

  conf.gem github: 'matsumoto-r/mruby-sleep' # worked
  conf.gem github: 'ascaridol/mruby-statemachine' # worked

  # ============================================================================
  # http client
  conf.gem github: 'mattn/mruby-http'
  conf.gem github: 'matsumoto-r/mruby-simplehttp'
  conf.gem github: 'matsumoto-r/mruby-httprequest' # worked
  # http server
  conf.gem github: 'matsumoto-r/mruby-simplehttpserver' # worked
  # http2 client and server
  # nghttp2 need
  # conf.gem github: 'matsumoto-r/mruby-http2' # TODO

  # conf.gem github: 'schmurfy/mruby-ping' # TODO

  conf.gem github: 'UniTN-mechatronics/mruby-ftp'
  # conf.gem github: 'matsumoto-r/mruby-vedis' # redis like server # TODO
  # conf.gem github: 'matsumoto-r/mruby-redis' # redis client
  # ============================================================================

  # mruby-libuv
  # conf.cc.flags << '-DMRB_INT64'
  conf.gem github: 'jbreeden/mruby-libuv' # no dependency
  conf.cc.flags << `pkg-config libuv --cflags`.strip
  conf.linker.flags << `pkg-config libuv --libs`.strip

  # ============================================================================
  # libffi # worked
  conf.gem "#{root}/mrbgems/mruby-eval"
  conf.gem github: 'fundamental/mruby-cfunc', branch: 'master' do |g|
    g.download_libffi
  end
  conf.gem "#{root}/mrbgems/mruby-struct"
  conf.gem github: 'schmurfy/mruby-rubyffi-compat'

  # ============================================================================

  # include the default GEMs
  conf.gembox 'default'
end
