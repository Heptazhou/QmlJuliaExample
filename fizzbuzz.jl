using QML
using Qt5QuickControls_jll
using Observables
"""
Translation of the FizzBuzz example from http://seanchas116.github.io/ruby-qml/
"""

function do_fizzbuzz(input::AbstractString, fb::AbstractDict)
	isempty(input) && return
	i = Int32(0)
	outputmessage = fb["message"]
	try
		i = parse(Int32, input)
	catch
		fb["message"][] = "parse error"
	end
	if i % 15 == 0
		outputmessage[] = "FizzBuzz"
		fb["success"] = true
		@emit fizzBuzzFound(i)
	elseif i % 3 == 0
		outputmessage[] = "Fizz"
	elseif i % 5 == 0
		outputmessage[] = "Buzz"
	else
		outputmessage[] = input
	end
	if fb["count"] == 2 && !fb["success"]
		@emit fizzBuzzFail()
	end
	fb["count"] += 1
	nothing
end

@qmlfunction do_fizzbuzz

qmlfile = joinpath(@__DIR__, "qml", "fizzbuzz.qml")
loadqml(qmlfile, fizzbuzz = JuliaPropertyMap("message" => Observable(""), "count" => 0, "success" => false))
exec()

