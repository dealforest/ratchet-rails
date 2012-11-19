require 'rails/generators'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module Ratchet
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "This generator installs Ratchet #{Ratchet::Rails::RATCHET_VERSION}"
        source_root File.expand_path("../templates", __FILE__)

        def copy_ratchet_javascripts
          say_status("copying", "Ratchet javascript (#{Ratchet::Rails::RATCHET_VERSION})", :green)
          copy_file "ratchet.js", "public/javascripts/ratchet.js"
        end

        def copy_ratchet_stylesheets
          say_status("copying", "Ratchet stylesheet (#{Ratchet::Rails::RATCHET_VERSION})", :green)
          copy_file "ratchet.css", "public/stylesheets/ratchet.css"
        end
      end
    end
  end
else
  module Ratchet
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)
        desc "This generator installs Ratchet #{Ratchet::Rails::RATCHET_VERSION} to Asset Pipeline"

        def add_assets
          if File.exist?('app/assets/javascripts/application.js')
            insert_into_file "app/assets/javascripts/application.js", "//= require ratchet\n", :after => "//= require jquery_ujs\n"
          else
            copy_file "application.js", "app/assets/javascripts/application.js"
          end

          if File.exist?('app/assets/stylesheets/application.css')
            # Add our own require:
            content = File.read("app/assets/stylesheets/application.css")
            if content.match(/require_tree\s+\.\s*$/)
              # Good enough - that'll include our ratchet.css.less
            else
              style_require_block = " *= require ratchet\n"
              insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
            end
          else
            copy_file "application.css", "app/assets/stylesheets/application.css"
          end
        end

        def add_ratchet
          copy_file "ratchet.js",  "app/assets/javascripts/ratchet.js"
          copy_file "ratchet.css", "app/assets/stylesheets/ratchet.css"
        end
      end
    end
  end
end
