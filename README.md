# sinatra/quiet_assets

It's annoying to see your logs blown up with asset requests.

```
127.0.0.1 - - [23/Dec/2013 19:50:04] "GET /assets/application.css HTTP/1.1" 200 521 0.0283
```

Register queit assets in the development configuration, and you won't see the assets in the development logs ever again. 

```ruby
configure :development do
  register Sinatra::QuietAssets
end
```

### Fair Warning

The script monkey-patches `Rack::CommonLogger`, based on version `1.6.0.alpha`. If Rack is updated with breaking changes, this script could break as well. *Edit*: still working with `sinatra 1.4.4`.

### Modifying Extensions

You can choose quiet asset extensions:

```ruby
Sinatra::QuietAssets.extensions = [ 'js', 'css' ]
```

Or add extensions to the defaults:

```ruby
Sinatra::QuietAssets.extensions << 'mp4'
Sinatra::QuietAssets.extensions += %w(mp3 wav)
```

### Installation

1. Copy `quiet_assets.rb` into your project folder, where other modules live.

2. Require the file, through a relative path or via the load path, and then register it.

  ```ruby
  # app.rb
  register Sinatra::QuietAssets
  ```

There's an example at `example/app.rb`.