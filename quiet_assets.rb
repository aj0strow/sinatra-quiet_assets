require 'sinatra/base'

module Sinatra
  module QuietAssets
    
    @extensions = %w(png jpg jpeg woff tff svg eot css js coffee scss)
    
    class << self
      attr_accessor :extensions
      
      def registered(app)
        ::Rack::CommonLogger.class_eval <<-PATCH
          alias call_and_log call
        
          def call(env)
            ext = env['REQUEST_PATH'].split('.').last
            if #{extensions.inspect}.include? ext
              @app.call(env)
            else
              call_and_log(env)
            end
          end
        PATCH
      end
    end

  end
end
