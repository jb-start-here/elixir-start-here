# In Elixir, all code runs inside processes. 
# Processes are isolated from each other, run concurrent to one another and communicate via message passing.
# Processes are not only the basis for concurrency in Elixir, 
# but they also provide the means for building distributed and fault-tolerant programs.
# They are different from OS processes. Elixir has its own implementation of a process.


# Kernel.spawn/1 is a method imported from kernel on boot. This method takes a function as 
# an argument and runs that function in a separate elixir processs which will referred to now as processes 
# unless other specified

spawn fn -> 1+4 end
# => PID<0.43.0>
# spawn/1 returns a PID (which is one of the types in elixir @typespec -> pid())

# this pid is the reference to this process that was spawned we can use any fn from Process module or many functions
# from Kernel on this pid

pid = spawn fn -> IO.puts "hello from another process" end
Process.alive? pid
# => false (the spawned process is long dead by now)

# we can retrieve the pid of the current executing process by calling Kernel.self() or self/0 in short
my_pid = self
Process.alive? my_pid
# => true ( the process still isnt dead yet it still has Process.alive? to execute!!!)



# Message Passing/ IPC
# We can use send/2 and receive/1 to send and receive messages from process
send pid, {[:one, :two, %{three: "3"}], :ok?, true}
# the second argument to send can be any data strucure or elixir construct

# receive/1 takes a do ...end block 
receive do
  {whatever, :ok?, true} -> IO.puts whatever[0]
  {whatever, :ok?, false} -> IO.puts "wrong msg"
end

# When a message is sent to a process, the message is stored in the process mailbox. 
# The receive/1 block goes through the current process mailbox searching for a message
# that matches any of the given patterns. receive/1 supports guards and many clauses, such as case/2.

# The process that sends the message does not block on send/2,
# it puts the message in the recipient’s mailbox and continues.
# In particular, a process can send messages to itself.

# If there is no message in the mailbox matching any of the patterns,
# the current process will wait until a matching message arrives. A timeout can also be specified
receive do
  {:hello, msg}  -> msg
after
  1_000 -> "nothing after 1s"
end

# A small exercise
parent = self
kiddo = spawn fn -> send(parent, {:hello, self()}) end
# This process puts the tuple in parent's process mailbox and dies
Process.alive?(kiddo)
receive do
  {:hello, kiddo_pid} -> "got hello from a process whose pid is #{inspect kiddo_pid}"
end
# The inspect/1 function is used to convert a data structure’s
# internal representation into a string, typically for printing

# flush/0 prints all the existing messages in the processes mailbox queue and finally prints :ok
send self, {:msg, "hello world"}
flush
# => {:msg, "hello world"}
#    :ok

# Links
# if a spawned process fails or raises an exception then the parent process doesnt crash
# if a process spawned with Kernel.spawn_link/1 fails -> then the exception will propogate and parent process will
# also shutdown
# We can also manually link nomrally spawned processes using Process.link/1
 

# Tasks

# Tasks are one software abstraction layer above processes.
# Tasks build on top of the spawn functions to provide better error reports and introspection

# Instead of spawn/1 and spawn_link/1, we use Task.start/1 and Task.start_link/1 which return {:ok, pid}
# rather than just the PID. This is what enables tasks to be used in supervision trees.
# Furthermore, Task provides convenience functions, like Task.async/1 and Task.await/1, 
# and functionality to ease distribution.