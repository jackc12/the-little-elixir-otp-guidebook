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
I think it could be an issue with the apk repository.

This Docker image is old and has an out of date apk repository.
Fixed by running following commands:
`sed -i 's/alpine\.gliderlabs\.com/dl-cdn.alpinelinux.org/g' /etc/apk/repositories`
`sed -i '/^@edge/d' /etc/apk/repositories`
`apk update`

and then to install erlang-observer:
`apk add erlang-observer`

This still does not fix the issue as `erlang-observer` requires `erlang-wx`.
Was not able to find `erlang-wx` on alpine 3.4 repository.
Moving on. I'll just try to use asdf on ubuntu or get the code to run on later elixir version.

