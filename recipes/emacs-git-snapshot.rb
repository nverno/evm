recipe 'emacs-git-snapshot' do
  git 'http://git.savannah.gnu.org/r/emacs.git'

  osx do
    option '--with-ns'
    option '--without-x'
    option '--without-dbus'
  end

  linux do
    option '--prefix', installation_path
    option '--with-modules'
    option '--with-xwidgets'
    option '--without-gif'
  end

  install do
    make 'bootstrap-clean'
    autogen 'all'
    configure
    make 'bootstrap'
    make 'install'

    osx do
      copy File.join(build_path, 'nextstep', 'Emacs.app'), installation_path
    end
  end
end
