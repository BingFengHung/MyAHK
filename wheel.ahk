#Requires AutoHotkey v2.0
#SingleInstance

^Down::MouseWheel("down", 3)
^Up::MouseWheel("up", 3)

MouseWheel(direction, clicks) {
  Loop clicks {
    if (direction = "down") {
      Send "{WheelDown}"
    } else {
      Send "{WheenUp}"
    }
  }

  return
}
