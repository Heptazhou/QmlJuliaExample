using QML
using Qt5QuickControls2_jll
using Observables

const x = Observable(0.0)
const y = Observable(0.0)

qmlfile = joinpath(@__DIR__, "qml", "sketch.qml")
# Load the QML file, using position as a context property

# Confirm that the point position is exposed to Julia
const positionskip = 10
const nb_moves = Ref(0)
on(x) do px
	nb_moves[] % positionskip == 0 && println("On position: ($px, $(y[]))")
	nb_moves[] += 1
end

loadqml(qmlfile, position = JuliaPropertyMap("x" => x, "y" => y))
exec()

"""
Example for sketching on a canvas
"""

