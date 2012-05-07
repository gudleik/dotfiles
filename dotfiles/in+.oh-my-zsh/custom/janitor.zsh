function update-stuff() {
  brew update
  gem update
  dotty update shellconfig
  dotty update vimconfig
  dotty update_submodules vimconfig

  brew outdated
}
