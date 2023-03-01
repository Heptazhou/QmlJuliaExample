@static @isdefined(QML) || Pkg.activate(@__DIR__)

using Test
using QML
using Qt5QuickControls_jll
using Plots

# No Python gui
ENV["MPLBACKEND"] = "Agg"

function init_backend(width::Float64, height::Float64, bestr::AbstractString)
	(width < 5 || height < 5) && return

	be = Symbol(lowercase(bestr))
	if be == :gr
		gr(size = (Int64(round(width)), Int64(round(height))))
		Plots.GR.inline()
	end
end

function plotsin(d::JuliaDisplay, amplitude::Float64, frequency::Float64)
	backend_name() == :none && return

	x = 0:π/100:π
	f = amplitude * sin.(frequency .* x)

	plt = plot(x, f, ylims = (-5, 5), show = false)
	display(d, plt)
	# close()

	nothing
end

gr()
@qmlfunction plotsin init_backend

qml_file = joinpath(@__DIR__, "qml", "plot.qml")
loadqml(qml_file)

# Run the application
exec()

