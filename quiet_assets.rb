require 'sinatra/base'

module Sinatra
  module QuietAssets
    # images, fonts, stylesheets, scripts
    @extensions = %w(png jpg jpeg ico gif woff tff svg eot css js)
    
    class << self
      attr_accessor :extensions
    end
    
    def self.registered(app)
      ::Rack::CommonLogger.class_eval <<-PATCH
        alias_method :call_with_logging, :call
        
        def call(env)
          ext = env['REQUEST_PATH'].split('.').last
          if #{extensions.inspect}.include? ext
            @app.call env
          else
            call_with_logging env
          end
        end
      PATCH
    end
  end
end
