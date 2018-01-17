# Phoenix + Turbolinks test case

Related issues:

* phoenix_html issue [#192](https://github.com/phoenixframework/phoenix_html/issues/192)
* ex_turbolinks issue [#6](https://github.com/imranismail/ex_turbolinks/issues/6)

## Problem

I'm using [`link/2`](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Link.html#link/2) to render `:get`, `:post` and `:delete` links:

```ex
link("show",   to: things_path(@conn, :show))
link("post",   to: things_path(@conn, :create), method: :post)
link("delete", to: things_path(@conn, :delete), method: :delete, data: [remote: true])
```

**Note:** `data: [remote: true]` in the delete link is optional, making it an XHR request.

But when using Turbolinks the `:post` and `:delete` links stop working. It seems `data-to="/things"` is ignored and instead it follows `href="#"`, causing errors like this:

```
no route found for POST / (PhoenixTestWeb.Router)
```

## Workaround

The following examples works with Turbolinks:

```ex
link("post",   to: things_path(@conn, :create), data: [method: :post])
link("delete", to: things_path(@conn, :delete), data: [method: :delete, remote: true])
```

## What about [`button`](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Link.html#button/2)?

The same approach doesn't seem to work with [`button/2`](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Link.html#button/2) :(

```ex
button("delete", to: things_path(@conn, :delete), data: [method: :delete, remote: true])
```

Output:

```html
<button data-csrf="csrf_token" data-method="delete" data-remote="true" data-to="/session">Logout</button>
```

# To start the Phoenix server

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
