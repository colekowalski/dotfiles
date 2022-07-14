import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Util.NamedScratchpad
import XMonad.Util.SpawnOnce
import XMonad.Util.Replace
import XMonad.Util.Run (hPutStrLn, spawnPipe)

import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myWorkspaces :: [WorkspaceId]
myWorkspaces = map show $ [1 .. 10 :: Int]

-- lessBorders OtherIndicated - No borders on full when all other screens
-- have borders. This seems like a resonable tradeoff
myLayout = avoidStruts $ lessBorders OtherIndicated (tiled ||| mirrorTiled ||| Grid ||| noBorders tabs)
  where
    tiled = renamed [Replace "tall"] $ ResizableTall 1 (3/100) (1/2) []
    mirrorTiled = renamed [Replace "mirror tall"] $ Mirror tiled
    tabs = renamed [Replace "tabs"] $ tabbed shrinkText myTabConfig
    myTabConfig = def { inactiveBorderColor = "#000000"
                      , activeTextColor = "#000000"
                      }

myScratchpads :: [NamedScratchpad]
myScratchpads = [ NS "slack" "slack" (appName =? "slack") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
                , NS "htop" "alacritty --class htop -e htop" (title =? "htop") defaultFloating
                ]


-- These are mostly lifted directly from the default keybindings defined in
-- Config.hs, with some modifications and additions
-- See: https://github.com/xmonad/xmonad/blob/master/src/XMonad/Config.hs
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,               xK_Return), spawn $ XMonad.terminal conf) -- %! Launch terminal
    , ((modMask .|. shiftMask, xK_c), kill) -- %! Close the focused window

    , ((modMask,               xK_space), sendMessage NextLayout) -- %! Rotate through the available layout algorithms
    , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf) -- %!  Reset the layouts on the current workspace to default

    , ((modMask,               xK_n), refresh) -- %! Resize viewed windows to the correct size

    -- move focus up or down the window stack
    , ((modMask,               xK_j), windows W.focusDown) -- %! Move focus to the next window
    , ((modMask,               xK_k), windows W.focusUp) -- %! Move focus to the previous window
    , ((modMask,               xK_m), windows W.focusMaster  ) -- %! Move focus to the master window

    -- modifying the window order
    , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster) -- %! Swap the focused window and the master window
    , ((modMask .|. shiftMask, xK_j), windows W.swapDown) -- %! Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_k), windows W.swapUp) -- %! Swap the focused window with the previous window

    -- resizing the master/slave ratio
    , ((modMask .|. shiftMask, xK_h), sendMessage Shrink) -- %! Shrink the master area
    , ((modMask .|. shiftMask, xK_l), sendMessage Expand) -- %! Expand the master area

    -- floating layer support
    , ((modMask,               xK_t), withFocused toggleFloat)

    -- increase or decrease number of windows in the master area
    , ((modMask              , xK_comma), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area

    -- quit, or restart
    , ((modMask .|. shiftMask, xK_q), io (exitWith ExitSuccess)) -- %! Quit xmonad
    , ((modMask              , xK_q), spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi") -- %! Restart xmonad

    -- Scratchpads
    , ((modMask              , xK_minus), namedScratchpadAction myScratchpads "slack")
    , ((modMask .|. shiftMask, xK_g), namedScratchpadAction myScratchpads "htop")

    , ((modMask              , xK_s), spawn "rofi -show combi")
    , ((modMask .|. controlMask, xK_l), spawn "xscreensaver-command -lock")

    -- handle workspace 10
    , ((modMask              , xK_0), windows $ W.greedyView "10")
    , ((modMask .|. shiftMask, xK_0), windows $ W.shift "10")
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r} %! Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r} %! Move client to screen 1, 2, or 3
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

    where
      toggleFloat w = windows (\s -> if M.member w (W.floating s)
                      then W.sink w s
                      else (W.float w (W.RationalRect (1/4) (1/6) (1/2) (2/3)) s))


myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
  [ isFullscreen --> doFullFloat
  ]


myStartupHook :: X ()
myStartupHook = do
  spawn "killall trayer"
  spawnOnce "picom"
  spawnOnce "nm-applet"
  spawn ("sleep 2 && trayer --edge top --align right --widthtype request --margin 2 --padding 2 --iconspacing 5 --SetDockType true --SetPartialStrut true --expand true --monitor 0 --tint 0x222000 --transparent true --alpha 0 --height 18 --distance 6")
  spawn "nitrogen --restore"


main :: IO ()
main = do
    xmproc <- spawnPipe ("xmobar -x 0")
    xmonad $ ewmhFullscreen $ withUrgencyHook NoUrgencyHook $ docks $ ewmh def
        { modMask = mod4Mask
        , focusFollowsMouse = False
        , keys = myKeys
        , workspaces = myWorkspaces
        , startupHook = myStartupHook
        , layoutHook = myLayout
        , manageHook = manageHook def <+> manageDocks <+> namedScratchpadManageHook myScratchpads <+> myManageHook
        , handleEventHook = handleEventHook def
        , logHook = dynamicLogWithPP $ filterOutWsPP [scratchpadWorkspaceTag] $ xmobarPP
              { ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor "#389dff" "" . wrap ("<box type=Bottom width=2 mb=1 mt=1 color=#0078c6>") "</box>"
              , ppVisibleNoWindows = Just (xmobarColor "yellow" "" . wrap "" "")
              , ppTitle = xmobarColor "gray" "" . shorten 48
              , ppUrgent = xmobarColor "#990000" "" . wrap "*" "*"
              }
        , borderWidth = 1
        , terminal = "alacritty"
        }
