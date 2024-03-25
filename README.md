# Code from The little Elixir & OTP Guidebook by Benjamin Tan Wei Hao

#### Command to start docker container running `alpine linux` with `elixir 1.3.4`
`docker compose run -it alpine-elixir`

#### Commands to start app in container
`mix deps.get`
`iex -S mix`
If encounter following error after running `mix deps.get` and when trying to compile the application with `iex -S mix`:
`** (Mix) Could not compile dependency :hackney, "/opt/app/.mix/rebar3 bare compile --paths "/Elixir_&_OTP_Guidebook/ch03/metex/_build/dev/lib/*/ebin"" command failed. You can recompile this dependency with "mix deps.compile hackney", update it with "mix deps.update hackney" or clean it with "mix deps.clean hackney"`

Run:

`mix local.rebar` 

Then confirm overwrite and run `iex -S mix` again
