require 'thor'

class Dotfiles
  
  respond_to?(:add_component) && add_component('shell_config')

  class ShellConfig < Thor
    include Thor::Actions
    
    ROOT = File.dirname(__FILE__)

    desc "bootstrap", "Creates vim symlinks in ~" 
    def bootstrap
      say "\n Bootstrapping Shell config \n", Thor::Shell::Color::ON_BLACK + Thor::Shell::Color::YELLOW + Thor::Shell::Color::BOLD
      inside ROOT do
        run 'git submodule init && git submodule update'
      end
      Dir[File.join(ROOT, 'dotfiles', '*')].each do |f|
        create_link '~/.' + File.basename(f), f
      end

      say "\nRemember to 'brew install ec2-api-tools rds-command-line-tools'\n", Thor::Shell::Color::RED
    end

    desc "update", "Updates all the script submodules"
    def update
      inside ROOT do
        run 'git submodule init && git submodule update'
      end
    end

  end

end
