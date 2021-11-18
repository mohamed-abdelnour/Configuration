-- Imports --
import           Data.Map                       ( Map )
import qualified Data.Map                      as M
import           Data.Monoid
import           GHC.IO.Handle
import           System.Exit
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import qualified XMonad.Layout.Fullscreen      as F
import           XMonad.Layout.Fullscreen       ( FullscreenFull )
import           XMonad.Layout.LayoutModifier
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.ResizableTile
import qualified XMonad.StackSet               as W
import           XMonad.Util.Run

-- General --
myTerminal :: String
myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth :: Dimension
myBorderWidth = 2

myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myNormalBorderColor :: String
myNormalBorderColor = "#1E1E1E"

myFocusedBorderColor :: String
myFocusedBorderColor = "#00D3D0"

-- Key bindings --
myKeys :: XConfig Layout -> Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig { XMonad.modMask = modm } =
  M.fromList
    $  [ ((modm, xK_Return)              , spawn $ XMonad.terminal conf)
       , ((modm, xK_v)                   , spawn "clipmenu -i")
       , ((modm, xK_p)                   , spawn "dmenu_run -i")
       , ((modm, xK_m)                   , spawn "emacs")
       , ((modm, xK_n)                   , spawn "emacsclient -nc")
       , ((modm, xK_b)                   , spawn "firefox")
       , ((modm, xK_o)                   , spawn "$HOME/.scripts/dmenu_open")
       , ((0, xK_Print)                  , spawn "$HOME/.scripts/screenshot")
       , ((0, 0X1008FF02)                , spawn "brightnessctl -q s +10%")
       , ((0, 0X1008FF03)                , spawn "brightnessctl -q s 10%-")
       , ((0, 0x1008FF11)                , spawn "amixer set Master 10%-")
       , ((0, 0x1008FF12)                , spawn "amixer set Master toggle")
       , ((0, 0x1008FF13)                , spawn "amixer set Master 10%+")
       , ((modm, xK_f), sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
       , ((modm, xK_c)                   , kill)
       , ((modm, xK_space)               , sendMessage NextLayout)
       , ((modm .|. shiftMask, xK_space) , setLayout $ XMonad.layoutHook conf)
       , ((modm .|. shiftMask, xK_n)     , refresh)
       , ((modm, xK_Tab)                 , windows W.focusDown)
       , ((modm, xK_j)                   , windows W.focusDown)
       , ((modm, xK_k)                   , windows W.focusUp)
       , ((modm .|. shiftMask, xK_m)     , windows W.focusMaster)
       , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
       , ((modm .|. shiftMask, xK_j)     , windows W.swapDown)
       , ((modm .|. shiftMask, xK_k)     , windows W.swapUp)
       , ((modm, xK_h)                   , sendMessage Shrink)
       , ((modm, xK_l)                   , sendMessage Expand)
       , ((modm .|. shiftMask, xK_l)     , sendMessage MirrorShrink)
       , ((modm .|. shiftMask, xK_h)     , sendMessage MirrorExpand)
       , ((modm, xK_t)                   , withFocused $ windows . W.sink)
       , ((modm, xK_i)                   , sendMessage (IncMasterN 1))
       , ((modm, xK_d)                   , sendMessage (IncMasterN (-1)))
       , ((modm .|. shiftMask, xK_b)     , sendMessage ToggleStruts)
       , ((modm .|. shiftMask, xK_x)     , io exitSuccess)
       , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
       , ((modm .|. shiftMask, xK_q)     , spawn "$HOME/.scripts/logout_menu")
       ]
    ++ [ ((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]

-- Mouse bindings --
myMouseBindings :: XConfig l -> Map (KeyMask, Button) (Window -> X ())
myMouseBindings XConfig { XMonad.modMask = modm } = M.fromList
  [ ( (modm, button1)
    , \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster
    )
  , ((modm, button3), \w -> focus w >> windows W.shiftMaster)
  , ( (mod1Mask, button1)
    , \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster
    )
  ]

-- Layouts --
myLayout
  :: ModifiedLayout
       AvoidStruts
       ( ModifiedLayout
           FullscreenFull
           (MultiToggle (HCons StdTransformers EOT) (Choose ResizableTall Full))
       )
       Window
myLayout =
  avoidStruts
    .   F.fullscreenFull
    .   mkToggle (NBFULL ?? EOT)
    $   ResizableTall 1 (3 / 100) (1 / 2) []
    ||| Full

-- Window rules --
myManageHook :: ManageHook
myManageHook = manageDocks <+> F.fullscreenManageHook

-- Event handling --
myEventHook :: Event -> X All
myEventHook = F.fullscreenEventHook

-- Status bars and logging --
myLogHook :: Handle -> X ()
myLogHook xmproc = dynamicLogWithPP $ xmobarPP
  { ppOutput          = hPutStrLn xmproc
  , ppCurrent         = xmobarColor "#00D3D0" "" . wrap "[" "]"
  , ppHidden          = xmobarColor "#FF8059" "" . wrap "" "*"
  , ppHiddenNoWindows = xmobarColor "#FFFFFF" ""
  , ppSep             = " | "
  , ppTitle           = xmobarColor "#00D3D0" "" . shorten 50
  , ppOrder           = \[w, _, t, x] -> [w, x, t]
  , ppExtras          = [windowProps]
  }

-- Startup hook --
myStartupHook :: X ()
myStartupHook = return ()

-- Defaults --
main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad . ewmh . docks $ def { terminal           = myTerminal
                              , focusFollowsMouse  = myFocusFollowsMouse
                              , clickJustFocuses   = myClickJustFocuses
                              , borderWidth        = myBorderWidth
                              , modMask            = myModMask
                              , workspaces         = myWorkspaces
                              , normalBorderColor  = myNormalBorderColor
                              , focusedBorderColor = myFocusedBorderColor
                              , keys               = myKeys
                              , mouseBindings      = myMouseBindings
                              , layoutHook         = myLayout
                              , manageHook         = myManageHook
                              , handleEventHook    = myEventHook
                              , logHook            = myLogHook xmproc
                              , startupHook        = myStartupHook
                              }

-- Function(s) --
windowProps :: X (Maybe String)
windowProps = do
  wc <- gets $ show . length . W.index . windowset
  wl <- gets $ description . W.layout . W.workspace . W.current . windowset
  let wp = case wl of
        "ResizableTall" -> "[]="
        "Full"          -> wrap "[" "]" wc
        _               -> ""
  return $ Just wp
