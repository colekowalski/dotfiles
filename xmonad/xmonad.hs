import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.Run (spawnPipe)
import System.IO (hPutStrLn)

import qualified Data.Map as M

myDzenBar = "dzen2 -ta 'l' -w '840' -h 20 -fg '#ffffff' -bg '#1b1d1e'"
myConkyBar = "conky -c /home/cole/.xmonad/conky_dzen.conf | dzen2 -x '840' -w '740' -h 20 -ta 'r' -fg '#ffffff' -bg '#1b1d1e'"
myTrayer = "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --transparent true --tint 0x222222 --alpha 0 --height 20 --width 100 --widthtype pixel"

myDzenPP  = dzenPP
  { ppCurrent = dzenColor "#3399ff" "" . wrap " " " "
  , ppHidden  = dzenColor "#dddddd" "" . wrap " " " "
  , ppHiddenNoWindows = dzenColor "#777777" "" . wrap " " " "
  , ppUrgent  = dzenColor "#ff0000" "" . wrap " " " "
  , ppSep     = " // "
  , ppLayout  = \y -> ""
  , ppTitle   = dzenColor "#ffffff" "" . wrap " " " "
  }

myLogHook h = dynamicLogWithPP $ myDzenPP { ppOutput = hPutStrLn h }

main = do
  dzenLeftBar <- spawnPipe myDzenBar
  dzenRightBar <- spawnPipe myConkyBar
  spawn myTrayer
  xmonad $ defaultConfig
    { terminal = "gnome-terminal"
    , modMask  = mod4Mask
    , keys = newKeys
    , workspaces = myWorkspaces
    , logHook = myLogHook dzenLeftBar
    , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ pidginLayoutHook $ smartBorders $ layoutHook defaultConfig
    , borderWidth = 1
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#535d6c"
    , startupHook = setWMName "LG3D"
    }

myWorkspaces = ["1:mail", "2:im", "3:web"] ++ map show [4..9]

myManageHook = composeAll
  [ (className =? "Pidgin"     --> doShift "2:im")
  , (className =? "Chromium"   --> doShift "3:web")
  , (className =? "Firefox"   --> doShift "3:web")
  , (className =? "VirtualBox" --> doFloat)
  , (className =? "qemu-system-x86_64" --> doFloat)
  , (className =? "Vlc"        --> doFloat)
  ]

pidginLayoutHook = onWorkspace "2:im" pidginLayout  
  where
    gridLayout = Grid
    pidginLayout = withIM (15/100) (Role "buddy_list") gridLayout

newKeys x = myKeys x `M.union` keys defaultConfig x
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
  [ ((modm, xK_p),    spawn "pidgin")
  , ((modm, xK_c),    spawn "chromium")
  , ((modm, xK_f),    spawn "firefox")
  , ((modm, xK_m),    spawn "vlc")
  , ((modm, xK_o),    spawn "okular")
  , ((modm, xK_Return), spawn "gnome-terminal")
  , ((0, 0x1008ff13), spawn "amixer -q set Master 2+")
  , ((0, 0x1008ff11), spawn "amixer -q set Master 2-")
  , ((0, 0x1008ff12), spawn "amixer -q set Master toggle")
  ]