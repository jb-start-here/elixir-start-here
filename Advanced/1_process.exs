defmodule Example do
  def a_method do
    :timer.sleep(500)
    exit(:boop)
  end

  @doc """
  lets spawn this `a_method` in a client below using link and monitor 
  and see how processes handle unexpected termination

  1. link -> lets two processes react when each other is terminated
  2. monitor -> only let the monitoring process know of monitored process' termination. It's a one way street.
  """
  def run do
  # Play around with below 4 lines to see the difference
    # spawn_link(Example, :a_method, [])
    # exit(:blap)
    # spawn_monitor(Example, :a_method, [])
    # exit(:blap)
    receive do
      msg -> IO.puts "MESSAGE RECEIVED : #{inspect msg}"
    after 
      1000 -> IO.puts "nothing happened as far as im concerned"
    end
  end
end
