defmodule Manyproc do

	def start_and_time(how_many) do
		{microseconds, :done} = :timer.tc(Manyproc, :start, [how_many])
		IO.puts "Elapsed: #{microseconds/1_000_000}"
	end

	def start(how_many), do: start_proc(how_many, self())

	def start_proc(0, pid) do
		# Last one. Send an 'ok' to the first Pid in the chain.
		send pid, :ok
	end

	def start_proc(how_many, pid) do
		# Create a child process that runs start_proc (this function)
		new_pid = spawn(Manyproc, :start_proc, [how_many-1, pid])

		# Send an 'ok' message to the child process
		send new_pid, :ok

		# Wait at the mailbox until we receive an 'ok' message (from our parent).
		receive do
			:ok -> :done
		end
	end
	
end
