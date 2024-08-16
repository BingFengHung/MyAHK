#Requires AutoHotkey v2.0

setup2() {
  restoreHotKeys2()

  ; 定義模式 2 的熱鍵行為
  Hotkey "h", MoveWindow_H, "On"
  Hotkey "l", MoveWindow_L, "On"
  Hotkey "k", MoveWindow_K, "On"
  Hotkey "j", MoveWindow_J, "On"
  Hotkey "w", Mode2_W, "On"
  Hotkey "e", Mode2_H, "On"
  Hotkey "^w", Mode2_Ws, "On"
  Hotkey "^e", Mode2_Hs, "On"

  Hotkey "+m", WinPos_Center, "On"
  Hotkey "+l", WinPos_Right, "On"
  Hotkey "+h", WinPos_Left, "On"
}

Mode2_Hs(ThisHotkey)
{
  Loop {
    if (!GetKeyState("e", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    H -= 10
    WinMove X, Y, W, H, "A"
  }
}

Mode2_H(ThisHotkey)
{
  Loop {
    if (!GetKeyState("e", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    H += 10
    WinMove X, Y, W, H, "A"
  }
}

Mode2_Ws(ThisHotkey) { 
  Loop {
    if (!GetKeyState("w", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    W -= 10
    WinMove X, Y, W, H, "A"
  }
}

Mode2_W(ThisHotkey) { 
  Loop {
    if (!GetKeyState("w", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    W += 10
    WinMove X, Y, W, H, "A"
  }
}

; 視窗往左邊移動
MoveWindow_H(ThisHotkey) {
  Loop {
    if (!GetKeyState("h", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    X -= 10
    WinMove X, Y, W, H, "A"
  }
}

; 視窗往右邊移動 
MoveWindow_L(ThisHotkey) {
  Loop {
    if (!GetKeyState("l", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    X += 10
    WinMove X, Y, W, H, "A"
  }
}

; 視窗往上面移動 
MoveWindow_K(ThisHotkey) {
  Loop {
    if (!GetKeyState("k", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    Y -= 10
    WinMove X, Y, W, H, "A"
  }
}

MoveWindow_J(ThisHotkey) {
  Loop {
    if (!GetKeyState("j", "P")) 
      break
    WinGetPos &X, &Y, &W, &H, "A"
    Y += 10
    WinMove X, Y, W, H, "A"
  }
}

WinPos_Center(ThisHotkey) {
  WinGetPos &X, &Y, &W, &H, "A"
  screenWidth := A_ScreenWidth
  screenHeight := A_ScreenHeight
  
  newX := (screenWidth / 2) - (W / 2)
  newY := (screenHeight / 2) - (H / 2)
  
  WinMove newX, newY,,,"A"
}

WinPos_Right(ThisHotkey) {
  WinGetPos &X, &Y, &W, &H, "A"
  screenWidth := A_ScreenWidth
  screenHeight := A_ScreenHeight
  
  newX := screenWidth - W 
  newY := (screenHeight / 2) - (H / 2)
  
  WinMove newX, newY,,,"A"
}

WinPos_Left(ThisHotkey) {
  WinGetPos &X, &Y, &W, &H, "A"
  screenWidth := A_ScreenWidth
  screenHeight := A_ScreenHeight
  
  newX := 0
  newY := (screenHeight / 2) - (H / 2)
  
  WinMove newX, newY,,,"A"
}

restoreHotKeys2() {
  Hotkey "h", MoveWindow_H, "Off"
  Hotkey "l", MoveWindow_L, "Off"
  Hotkey "k", MoveWindow_K, "Off"
  Hotkey "j", MoveWindow_J, "Off"
  Hotkey "w", Mode2_W, "Off"
  Hotkey "e", Mode2_H, "Off"
  Hotkey "^w", Mode2_Ws, "Off"
  Hotkey "^e", Mode2_Hs, "Off"

  Hotkey "+m", WinPos_Center, "Off"
  Hotkey "+l", WinPos_Right, "Off"
  Hotkey "+h", WinPos_Left, "Off"
}