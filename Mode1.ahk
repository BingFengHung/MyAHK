#Requires AutoHotkey v2.0

setup1() {
    restoreHotKeys()

    ; 定義模式 1 的熱鍵行為
    Hotkey "h", Mode1_H, "On"
    Hotkey "l", Mode1_L, "On"
    Hotkey "k", Mode1_K, "On"
    Hotkey "j", Mode1_J, "On"
    Hotkey "^h", Mode1_HS, "On"
    Hotkey "^l", Mode1_LS, "On"
    Hotkey "^k", Mode1_KS, "On"
    Hotkey "^j", Mode1_JS, "On"
    Hotkey "^u", Mode1_U, "On"
    Hotkey "^d", Mode1_D, "On"
    Hotkey "1", Mode1_LeftClick, "On"
    Hotkey "2", Mode1_RightClick, "On"
    Hotkey "3", MouseDragStart, "On"
    Hotkey "4", MouseDragEnd, "On"
}

Mode1_H(ThisHotkey)
{
    currentSpeed := 10
    DllCall("mouse_event", "UInt", 0x0001, "Int", -currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
    ToolTip("h 鍵已按下，滑鼠已移動")
}

Mode1_L(ThisHotkey) { 
    currentSpeed := 10  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
    ToolTip("l 鍵已按下，滑鼠已移動")
}

Mode1_K(ThisHotkey) {
    currentSpeed := 10  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -currentSpeed, "UInt", 0, "UPtr", 0)
    ToolTip("k 鍵已按下，滑鼠已移動")
}
Mode1_J(ThisHotkey) { 
    currentSpeed := 10  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", currentSpeed, "UInt", 0, "UPtr", 0)
    ToolTip("j 鍵已按下，滑鼠已移動")
}
Mode1_HS(ThisHotkey)
{
    currentSpeed := 30
    DllCall("mouse_event", "UInt", 0x0001, "Int", -currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
    ToolTip("h 鍵已按下，滑鼠已移動")
}

Mode1_LS(ThisHotkey) { 
    currentSpeed := 30  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", currentSpeed, "Int", 0, "UInt", 0, "UPtr", 0)
    ToolTip("l 鍵已按下，滑鼠已移動")
}

Mode1_KS(ThisHotkey) {
    currentSpeed := 30  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -currentSpeed, "UInt", 0, "UPtr", 0)
    ToolTip("k 鍵已按下，滑鼠已移動")
}
Mode1_JS(ThisHotkey) { 
    currentSpeed := 30  ; 設置移動速度
    DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", currentSpeed, "UInt", 0, "UPtr", 0)
    ToolTip("j 鍵已按下，滑鼠已移動")
}
Mode1_U(ThisHotkey) { 
    Loop 3 {
        Send "{WheelUp}"
    }
    return
}
Mode1_D(ThisHotkey) { 
    Loop 3 {
        Send "{WheelDown}"
    }
    return
}

Mode1_LeftClick(ThisHotkey) { 
    global isAlt1Active
    global isAlt2Active
    
    if (isAlt1Active || isAlt2Active) {
        MouseClick "left"
    }
    return
}

Mode1_RightClick(ThisHotkey) { 
    global isAlt1Active
    global isAlt2Active

    if (isAlt1Active || isAlt2Active) { 
        MouseClick "right" 
    }

    return
}

isHold := false

MouseDragStart(ThisHotkey) { 
    global isHold

    if (isHold = false) {
        WinGetPos &X, &Y, &W, &H, "A"
        MouseGetPos &mouseX, &mouseY
        MouseClick "left", mouseX, mouseY, , , "D"
        isHold := true
    }
}

MouseDragEnd(ThisHotkey) {
    global isHold

    if (isHold = true) {
        WinGetPos &X, &Y, &W, &H, "A"
        MouseGetPos &mouseX, &mouseY
        MouseClick "left", mouseX, mouseY, , , "U"
        isHold := false
    }
}

restoreHotKeys()
{ 
    global isHold
    if (isHold = true) {
        WinGetPos &X, &Y, &W, &H, "A"
        MouseGetPos &mouseX, &mouseY
        MouseClick "left", mouseX, mouseY, , , "U"
        isHold := false
    }
    Hotkey "h", Mode1_H, "Off"
    Hotkey "l", Mode1_L, "Off"
    Hotkey "k", Mode1_K, "Off"
    Hotkey "j", Mode1_J, "Off"
    Hotkey "^u", Mode1_U, "Off"
    Hotkey "^d", Mode1_D, "Off"
    Hotkey "1", Mode1_LeftClick, "Off"
    Hotkey "2", Mode1_RightClick, "Off"
    Hotkey "^h", Mode1_HS, "Off"
    Hotkey "^l", Mode1_LS, "Off"
    Hotkey "^k", Mode1_KS, "Off"
    Hotkey "^j", Mode1_JS, "Off"
    Hotkey "3", MouseDragStart, "Off"
    Hotkey "4", MouseDragEnd, "Off"
}
