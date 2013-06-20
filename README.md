# sinatra/quiet_assets

This script is to be used in a modular app, and registered in the development configuration like so:

```ruby
configure :development do
  register Sinatra::QuietAssets
end
```

### Fair Warning

The script monkey-patches `Rack::CommonLogger`, and is based on the code for version `1.6.0.alpha`. If Rack is updated with breaking changes, this script could be broken. 

### Modifying Extensions

Set the extensions to your choosing:

```ruby
Sinatra::QuietAssets.extensions = [ 'js', 'css' ]
```

Or add extensions to the defaults:

```ruby
Sinatra::QuietAssets.extensions << 'mp4'
Sinatra::QuietAssets.extensions += %w(mp3 wav)
```

### Installation

Copy `quiet_assets.rb` into your application folder, and require it. Hopefully it will be in a gem, or even better yet in `sinatra-contrib` soon. 