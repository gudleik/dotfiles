# Load rubygems, wirble and pp
%w{wirble hirb ap}.each do |lib| 
  begin 
    require lib 
  rescue LoadError => err
    #$stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

# Load additional config for rails
load File.dirname(__FILE__) + '/config/irb-rails' if $0 == 'irb' && ENV['RAILS_ENV']

if defined?(Wirble)
  %w{init colorize}.each { |str| Wirble.send(str) }
end

#Hirb.enable
