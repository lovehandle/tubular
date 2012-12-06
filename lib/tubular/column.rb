module Tubular
  class Column

    attr_reader :context, :method_name, :header_html,
      :header_content, :cell_html, :cell_content

    delegate :t, :to => :context

    def initialize(context, *args, &block)
      attributes = args.extract_options!

      @context        = context
      @method_name    = attributes.fetch(:method_name, args.shift)
      @header_html    = attributes.fetch(:header_html, {})
      @header_content = attributes.fetch(:header_content, nil)
      @cell_html      = attributes.fetch(:cell_html, {})
      @cell_content   = attributes.fetch(:cell_content, nil)

      if block_given?
        @cell_content = block
      end
    end

    def render_header_content
      case header_content
      when Proc 
        header_content.call
      when String, Symbol
        t(header_content)
      when NilClass
        method_name ? t(method_name) : nil
      end
    end

    def render_body_content(record)
      case cell_content
      when Proc
        call_content_proc(cell_content, record)
      when NilClass
        method_name && record.respond_to?(method_name) ? record.send(method_name) : nil
      else
        cell_content.to_s
      end
    end

    protected

    def call_content_proc(content, record = nil)
      content.arity > 0 ? content.call(record) : content.call
    end

  end # class Column
end # module Tubular
