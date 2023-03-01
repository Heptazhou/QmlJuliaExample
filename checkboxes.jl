@static @isdefined(QML) || Pkg.activate(@__DIR__)

using QML
using Qt5QuickControls_jll
#=
A simple gui. A set of diagrams can be selected with check boxes.
They should be displayed, when the button "Plot" is clicked.
Currently only an array with the numbers of the selected diagrams
will be printed.
=#

"""
Convert a floating point number with values of the checkboxes, encoded
as sum of potences of two into an array that contains the numbers of the
checkboxes, that are checked.
"""
function plot_diagram(param)
	plot_set = round(Int, param)
	a = Int64[]
	plot_set >= 256 && (push!(a, 8); plot_set -= 256)
	plot_set >= 128 && (push!(a, 8); plot_set -= 128)
	plot_set >= 064 && (push!(a, 7); plot_set -= 064)
	plot_set >= 032 && (push!(a, 6); plot_set -= 032)
	plot_set >= 016 && (push!(a, 5); plot_set -= 016)
	plot_set >= 008 && (push!(a, 4); plot_set -= 008)
	plot_set >= 004 && (push!(a, 3); plot_set -= 004)
	plot_set >= 002 && (push!(a, 2); plot_set -= 002)
	plot_set >= 001 && (push!(a, 1); plot_set -= 001)
	# In the real application you would here call the plotting routine
	println(a)
	0
end

@qmlfunction plot_diagram

loadqml(joinpath(@__DIR__, "qml", "checkboxes.qml"))
exec()

