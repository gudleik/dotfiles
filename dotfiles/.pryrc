# self.send(:include, Rails::ConsoleMethods) if defined? Rails

%w{ap hirb pry-doc pry-editline}.each do |gem| 
  begin
    require gem
  rescue LoadError
    puts "Cannot load #{gem}"
  end 
end

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = true
Pry.plugins["editline"].activate!
Pry.plugins["doc"].activate!
Pry.config.editor = "mvim --nofork"
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

if defined? Wirble
  %w{init colorize}.each { |str| Wirble.send(str) }
end

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env

# tell pry to use awesome_print as printer (too noisy)
# Pry.print = proc { |output, value| output.puts value.ai }

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  # require rails
#
#  if Rails.version[0..0] == "2"
#    require 'console_app'
#    require 'console_with_helpers'
#  elsif Rails.version[0..0] == "3"
#    require 'rails/console/app'
#    require 'rails/console/helpers'
#  else
#    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
#  end
#
  # if Kernel.const_defined?("Rails") then
  #   require File.join(Rails.root,"config","environment")
  #   require 'rails/console/app'
  #   require 'rails/console/helpers'
  #   if Rails.version =~ /3.2/
  #     def reload!
  #       ActionDispatch::Reloader.cleanup!
  #       ActionDispatch::Reloader.prepare!
  #     end
  #   end
  # else
  #   warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  #   Pry::RailsCommands.instance_methods.each do |name| 
  #     Pry::Commands.command name.to_s do 
  #       Class.new.extend(Pry::RailsCommands).send(name)
  #     end
  #   end
  # end
end
