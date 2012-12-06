module Tubular
  module Helper
    def table_for(collection, options = {}, &block)
      options.merge!({
        :context    => self,
        :collection => collection
      })

      Builder.render(options, &block)
    end
  end
end
