#Requires AutoHotkey v2.0
#SingleInstance

isAlt1Active := true
isAlt2Active := true

setup() {
  ~h:: ; 偵測 h 鍵按下
  {
      global isAlt1Active
      global isAlt2Active

      if (isAlt1Active) {
          currentSpeed := 10  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", -currentSpeed, "Int", 0, "UInt", 0, "Ptr", 0)
          ToolTip("h 鍵已按下，滑鼠已移動")
      } else if (isAlt2Active) {
          currentSpeed := 30  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", -currentSpeed, "Int", 0, "UInt", 0, "Ptr", 0)
          ToolTip("h 鍵已按下，滑鼠已移動")
      }
      return
  }

  ~l:: {
      global isAlt1Active
      global isAlt2Active

      if (isAlt1Active) {
          currentSpeed := 10  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
          ToolTip("l 鍵已按下，滑鼠已移動")
      } else if (isAlt2Active) {
          currentSpeed := 30  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
          ToolTip("l 鍵已按下，滑鼠已移動")
      }
      return
  }

  ~k:: {
      global isAlt1Active
      global isAlt2Active

      if (isAlt1Active) {
          currentSpeed := 10  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -currentSpeed, "UInt", 0, "UPtr", 0)
          ToolTip("k 鍵已按下，滑鼠已移動")
      } else if (isAlt2Active) {
          currentSpeed := 30  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -currentSpeed, "UInt", 0, "UPtr", 0)
          ToolTip("k 鍵已按下，滑鼠已移動")
      }
      return
  }

  ~j:: {
      global isAlt1Active
      global isAlt2Active

      if (isAlt1Active) {
          currentSpeed := 10  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", currentSpeed, "UInt", 0, "UPtr", 0)
          ToolTip("j 鍵已按下，滑鼠已移動")
      } else if (isAlt2Active) {
          currentSpeed := 30  ; 設置移動速度
          DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", currentSpeed, "UInt", 0, "UPtr", 0)
          ToolTip("j 鍵已按下，滑鼠已移動")
      }
      return
  }


  ; 滑鼠滾輪向上
  ^u::{
    global isAlt1Active
    global isAlt2Active
    
    if (isAlt1Active || isAlt2Active) {
      MouseClick "WheelUp",,, 2
    }
    return
  }

  ; 滑鼠滾輪向下
  ^d:: {
    global isAlt1Active
    global isAlt2Active
    
    if (isAlt1Active || isAlt2Active) {
      MouseClick "WheelDown",,, 2
    }
    return
  }

  ; 滑鼠左鍵
  ~1:: {
    global isAlt1Active
    global isAlt2Active
    
    if (isAlt1Active || isAlt2Active) {
      MouseClick "left"
    }
    return
  }

  ; 滑鼠右鍵
  ~2:: {
    global isAlt1Active
    global isAlt2Active
    
    if (isAlt1Active || isAlt2Active) {
      MouseClick "right"
    }
    return
  }
}