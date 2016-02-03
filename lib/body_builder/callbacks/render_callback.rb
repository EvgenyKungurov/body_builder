module BodyBuilder
  module RenderCallback
    def require_defult_template_for(*args)
      if args.include? :all
        @render_callbacks
        @render_callbacks << 'edit' << 'new'
      else
        args.each { |el| @render_callbacks << el.to_s }
      end
    end
  end
end
