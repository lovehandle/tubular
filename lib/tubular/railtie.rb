require "tubular/helper"

class Tubular::Railtie < Rails::Railtie
  config.before_initialize do
    ActionView::Base.send(:include, Tubular::Helper)
  end
end
