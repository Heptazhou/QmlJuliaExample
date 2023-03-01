@static @isdefined(QML) || Pkg.activate(@__DIR__)

using QML
using Qt5QuickControls_jll

qml_file = joinpath(@__DIR__, "qml", "repl-background.qml")

@qmlfunction pushdisplay
loadqml(qml_file)
exec_async()

using GR
GR.inline()

# Include from the REPL, and then add plotting commands, e.g.
plot(rand(10, 2))

