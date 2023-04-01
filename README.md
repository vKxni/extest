### Figuring out stuff 1.7.1 phx

**How to add a new HTML page in Phoenix Liveview 1.7.X+**

:one:  Create a new route:
`/testweb_web/router.ex`
```elixir
scope "/", ExtestWeb do
    pipe_through :browser

    # template page
    get "/", PageController, :home

    # our new page
    get "/lol", LolController, :hello
  end
```

:two: Create controllers
This became kinda weird in 1.7, its flooding the whole thing, maybe I havent figured out the best way yet o.O. 
Just create the following files (replace with your real filename, instead of "lol").
- `/controllers/lol_controller.ex`
- `/controllers/lol_html.ex`
- `/controllers/lol_html/lol.html.heex`

First one is going to be a simple one, like we already know it from older versions.
lol_controller.ex
```elixir
defmodule TestwebWeb.LolController do
  use TestwebWeb, :controller

  def hello(conn, _params) do
    render(conn, :lol, layout: false)
  end
end
```

lol_html.ex
```elixir
defmodule TestwebWeb.LolHTML do
  use TestwebWeb, :html

  # directory is called lol_html (point 3, second step)
  embed_templates "lol_html/*"
end
```

lol_html/lol.html.heex
```html
<div class="flex flex-center justify-center h-screen>
  <h1>lol there, its working!</h1>
</div>
```

That's basically it. 

> Where is the `:lol` atom coming from within the render function in the controller?
That's basically the name of our template, `LolHTML` so the file that handles our HTML files.

> How can I create functions that are api-request only, without HTML?
Basically it's similar, create a route, create the controller like this: 
`/testweb_web/controllers/apitest/api_controller.ex`
```elixir
defmodule TestwebWeb.EzController do
  use TestwebWeb, :controller

  def ping(conn, _params) do
    json(conn, "lol there!")
  end
end
```

> Can I remove `layout: false`?
Yes, it will add the `app.html.heex` code to it (header)

> Better structure to avoid flooding?
You can move your controller into your `xyz_html` folder. But putting `XYZ.html.ex` within your html folders throws an error :thinking: