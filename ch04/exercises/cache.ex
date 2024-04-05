defmodule Cache do
  use GenServer

  @name CACHE

  ## Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end

  def write(key, val) do
    GenServer.cast(@name, {:write, key, val})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exist?(key) do
    GenServer.call(@name, {:exist, key})
  end

  ## Server Callbacks

  @impl GenServer
  def init(:ok) do
    {:ok, %{}}
  end

  @impl GenServer
  def handle_cast({:write, key, val}, state) do
    {:noreply, Map.put(state, key, val)}
  end

  @impl GenServer
  def handle_cast({:delete, key}, state) do
    {:noreply, Map.delete(state, key)}
  end

  @impl GenServer
  def handle_cast(:clear, _state) do
    {:noreply, %{}}
  end

  @impl GenServer
  def handle_call({:read, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl GenServer
  def handle_call({:exist, key}, _from, state) do
    {:reply, Map.has_key?(state, key), state}
  end
end
