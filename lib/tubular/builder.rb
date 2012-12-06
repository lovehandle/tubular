module Tubular
  class Builder

    delegate :content_tag, :to => :context

    def self.render(*args, &block)
      new(*args, &block).render
    end

    def initialize(attributes, &block)
      @context    = attributes.fetch(:context)
      @collection = attributes.fetch(:collection, []) 
      @table_html = attributes.fetch(:table_html, {})
      @columns    = []

      if block_given?
        instance_eval(&block)
      end
    end

    def render
      content_tag(:table, table_html) do
        (render_table_head + render_table_body) if columns.size > 0
      end
    end

    def column(*args, &block)
      columns << build_column(*args, &block) 
    end

    protected

    attr_reader :context, :collection, :columns, :table_html

    def build_column(*args, &block)
      Column.new(context, *args, &block)
    end

    def render_table_head
      content_tag(:thead) do
        content_tag(:tr) do
          columns.map do |column| 
            content_tag(:th, column.header_html) do
              column.render_header_content
            end
          end.join.html_safe
        end
      end
    end

    def render_table_body
      content_tag(:tbody) do
        collection.map do |record|
          content_tag(:tr) do
            columns.map do |column|
              content_tag(:td, column.cell_html) do
                column.render_body_content(record)
              end
            end.join.html_safe
          end
        end.join.html_safe
      end
    end

  end # class Builder
end # module Tubular
