defmodule ThySupervisor do
  use GenServer

  #######
  # API #
  #######

  def start_link(child_spec_list) do
    GenServer.start_link(__MODULE__, [child_spec_list])
  end

  ######################
  # Callback Functions #
  ######################
  def init([child_spec_list]) do
    Process.flag(:trap_exit, true)
    state = child_spec_list
      |> start_children
      |> Enum.into(HashDict.new)

    {:ok, state}
  end
end
