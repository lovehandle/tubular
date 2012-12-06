require "tubular/helper"

module Tubular
  class Railtie < Rails::Railtie
    initializer "tubular_railtie.configure_rails_initialization" do
      ActionView::Base.send(:include, Tubular::Helper)
    end 
  end # class Railtie
end # module Tubular
