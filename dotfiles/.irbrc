# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  # global_gemset = %x{~/.rbenv/versions/$(rbenv global)/lib/ruby/gems/1.9.1}

  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end
# Use Pry everywhere
require "rubygems"
require 'pry'
# require 'pry-editline'
# require 'pry-doc'
Pry.start
exit
