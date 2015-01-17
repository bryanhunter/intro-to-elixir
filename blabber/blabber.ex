defmodule Blabber do
	def start do
		spawn( fn -> loop(0) end )
	end

	def loop(uptime) do
		receive do
			:stop ->
				IO.puts "Shutting blabber down..."
				:ok
			after 2000 ->
				IO.puts "Announcing #{uptime} years of bgu-free uptime!"
				Blabber.loop(uptime + 1)
			end
		end
	end
