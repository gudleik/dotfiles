function update-stuff() {
  brew update
  gem update
  dotty update shellconfig
  dotty update vimconfig
  dotty update_submodules vimconfig

  update-rbenv-plugins

  brew outdated
}

function update-rbenv-plugins() {
  pwd=$(pwd) 
  for plugin in ~/.rbenv/plugins/*; do
    cd $plugin
    git pull -q origin master
  done

  cd $pwd
} 
