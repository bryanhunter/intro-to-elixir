defmodule Average do
	def calculate(list_of_numbers) do
		show_progress "Getting started"
		answer = solve_for list_of_numbers
		show_progress "Answer: #{answer}"
	end
	def solve_for(list, position \\ 0, running_sum \\ 0)
	def solve_for([head|tail], position, running_sum) do
		show_progress "Position: #{position} Running Sum: #{running_sum}"
		solve_for tail, (position + 1), (running_sum + head)
	end

	def solve_for([], position, running_sum) do
		show_progress "Finishing up"
		running_sum / position
	end

	defp show_progress(status) do
		IO.puts "Status: #{status}"
	end
end

Average.calculate [10, 20, 50, 90, 100]
