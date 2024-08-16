#Requires AutoHotkey v2.0
#SingleInstance

#Include "Mode1.ahk"
#Include "Mode2.ahk"

; 初始化模式
isAlt1Active := false
isAlt2Active := false

; 使用 Alt + 1, Alt + 2 切換模式
!1::
{
  global isAlt1Active
  global isAlt2Active
  
  isAlt1Active := !isAlt1Active
  isAlt2Active := false
  
  restoreAllHotKeys()

  if (isAlt1Active) {
    ReloadMode()
    ToolTip("模式 1 啟用")
  } else {
    ToolTip("")
  }

  return
}

!2::
{
  global isAlt1Active
  global isAlt2Active
  isAlt1Active := false
  isAlt2Active := !isAlt2Active
  
  restoreAllHotKeys()
  if (isAlt2Active) {
    ReloadMode()
    ToolTip("模式 2 啟用")
  } else {
    ToolTip("")
  }
  return
}

ReloadMode()
{
    global isAlt1Active
    global isAlt2Active

    ; 載入新的熱鍵功能
    if (isAlt1Active)
    {
      setup1()
    }
    else if (isAlt2Active)
    {
      setup2()
    }
}

restoreAllHotKeys() {
  restoreHotKeys()
  restoreHotKeys2()
}