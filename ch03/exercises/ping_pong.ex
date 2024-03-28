defmodule PingPong do
  def ping() do
    receive do
      {pid, :ping} ->
        send(pid, :pong)
        ping()

      _ ->
        ping()
    end
  end

  def pong() do
    receive do
      {pid, :pong} ->
        send(pid, :ping)
        pong()

      _ ->
        pong()
    end
  end

  def ping_pong() do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    send(ping_pid, {self(), :ping})
    send(pong_pid, {self(), :pong})

    receive do
      :ping -> IO.puts("received ping")
    end

    receive do
      :pong -> IO.puts("received pong")
    end
  end
end
