using QML
using Qt5QuickControls_jll

@qmlfunction println
loadqml(joinpath(@__DIR__, "qml", "drag.qml"))
exec()

