recipe 'emacs-24.5-patch' do
  tar_gz 'http://ftpmirror.gnu.org/emacs/emacs-24.5.tar.gz'

  osx do
    option '--with-ns'
    option '--without-x'
    option '--without-dbus'
  end

  linux do
    option 'CFLAGS=-no-pie'
    option '--prefix', installation_path
    option '--without-gif'
  end

  install do
    configure
    make 'bootstrap'
    make 'install'

    osx do
      copy File.join(build_path, 'nextstep', 'Emacs.app'), installation_path
    end
  end
end
