#Requires AutoHotkey v2.0
#SingleInstance

; 設定全域變數來追蹤是否啟動了調整模式
global resizeMode := false

; Alt + 3 啟動或關閉調整模式


Hotkey "^!h", IncreaseHeight

IncreaseHeight(ThisHotkey) {
  Loop {
    if (!GetKeyState("h", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    H += 10
    WinMove X, Y, W, H, "A"
  }
}

Hotkey "^!z", MyFunc

MyFunc(ThisHotkey)
{
    MsgBox "You pressed " ThisHotkey
}