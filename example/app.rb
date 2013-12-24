require 'sinatra'
require_relative '../quiet_assets'

register Sinatra::QuietAssets

get '/test.html' do
  "logs\n"
end

get '/test.css' do
  "doesn't log\n"
end

__END__

You can test the logging with the following curls:

$ curl localhost:4567/test.html
$ curl localhost:4567/test.css