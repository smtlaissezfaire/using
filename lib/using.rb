begin
  require "facets/string/pathize"
rescue LoadError
  raise LoadError, "You must install the facets gem to use the 'Using' package"
end

module Using
  unless defined?(LOAD_SCHEMES)
    LOAD_SCHEMES = [:require, :load, :autoload]

    module DefaultLoadSchemes
      def reset_default_load_scheme!
        @default_load_scheme = nil
      end

      def default_load_scheme=(load_scheme)
        @default_load_scheme = load_scheme
      end

      def default_load_scheme
        @default_load_scheme ||= LOAD_SCHEMES.first
      end
    end

    extend DefaultLoadSchemes

    def load_scheme
      @load_scheme ||= ::Using.default_load_scheme
    end

    def load_scheme=(load_scheme)
      if LOAD_SCHEMES.include?(load_scheme)
        @load_scheme = load_scheme
      else
        raise
      end
    end

    def with_load_scheme(scheme)
      old_scheme = load_scheme
      self.load_scheme = scheme
      yield
    ensure
      self.load_scheme = old_scheme
    end

    def using(const_name)
      path = File.expand_path(caller(1)[0].gsub(/\.rb.*$/, ""))
      file_name = const_name.to_s.pathize

      case load_scheme
        when :require   then require  File.join(path, file_name)
        when :load      then load     File.join(path, "#{file_name}.rb")
        when :autoload  then autoload const_name, File.join(path, file_name)
      end
    end
  end
end
