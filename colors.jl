@static @isdefined(QML) || Pkg.activate(@__DIR__)

using QML
using Qt5QuickControls_jll

loadqml(joinpath(@__DIR__, "qml", "tutorial.qml"))
exec()

"""
Example for using a mouse area and for implementing animations in QML.
"""

