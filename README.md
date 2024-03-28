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

### :observer.start not working:
`** (UndefinedFunctionError) function :observer.start/0 is undefined (module :observer is not available)
    :observer.start()`

No issue on macos. not sure about docker on macos.
Fixed on ubuntu with:
`sudo apt-get install erlang-observer`
Trying to install on alpine but:
`apk add erlang-observer`
results in:
`ERROR: erlang-observer-18.3.2-r0: temporary error (try again later)
5 errors; 38 MiB in 28 packages`
I think it could be an issue with the mirror.

