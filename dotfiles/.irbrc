# Load rubygems, wirble and pp
%w{pry wirble hirb ap}.each do |lib| 
  begin 
    require lib 
  rescue LoadError => err
    #$stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

# Load additional config for rails
load '~/.irb-rails' if $0 == 'irb' && ENV['RAILS_ENV']

if defined? Wirble
  %w{init colorize}.each { |str| Wirble.send(str) }
end

if defined? Pry
  #pry
end
#Hirb.enable
