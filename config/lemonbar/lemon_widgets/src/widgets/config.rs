// Widgets Type Listed
#[derive(Debug, Clone, Copy)]
#[repr(usize)]
pub enum WidgetType {
    Network     = 0,
    Battery     = 1,
    Speaker     = 2,
    Microphone  = 3,
}

// Color constants
pub const BG_COLOR: &str = "#2f2f2f";
pub const NETWORK_CONNECTED: &str = "#1FFFF6";
pub const NETWORK_DISCONNECTED: &str = "#FF1F00";
pub const AUDIO_MUTED: &str = "#FF0100";
pub const AUDIO_UNMUTED: &str = "#FF630F";


// Time interval constants
pub const BAT_REPEAT_INTERVAL: i32 = 60;
pub const NET_REPEAT_INTERVAL: i32 = 30;
pub const SPK_REPEAT_INTERVAL: i32 = 20;
pub const MIC_REPEAT_INTERVAL: i32 = 20;

/*
* Widget Actions
*/
// BATTERY
pub const BAT_LEFT: &str = "";
pub const BAT_RIGHT: &str = "";
pub const BAT_SCROLL_UP: &str = "";
pub const BAT_SCROLL_DOWN: &str = "";

// NETWORK: &str = "";
pub const NET_LEFT: &str = "";
pub const NET_RIGHT: &str = "";
pub const NET_SCROLL_UP: &str = "";
pub const NET_SCROLL_DOWN: &str = "";

// MICROPHONE: &str = "";
pub const MIC_LEFT: &str = "/usr/bin/env amixer -D pulse sset Capture toggle && kill -USR1 #PID#";
pub const MIC_RIGHT: &str = "/usr/bin/env pavucontrol && kill -USR1 #PID#";
pub const MIC_SCROLL_UP: &str = "/usr/bin/env amixer -D pulse sset Capture 5%+ && kill -USR1 #PID#";
pub const MIC_SCROLL_DOWN: &str = "/usr/bin/env amixer -D pulse sset Capture 5%- && kill -USR1 #PID#";

// SPEAKER: &str = "";
pub const SPK_LEFT: &str = "/usr/bin/env amixer -D pulse sset Master toggle && kill -USR1 #PID#";
pub const SPK_RIGHT: &str = "/usr/bin/env pavucontrol && kill -USR1 #PID#";
pub const SPK_SCROLL_UP: &str = "/usr/bin/env amixer -D pulse sset Master 5%+ && kill -USR1 #PID#";
pub const SPK_SCROLL_DOWN: &str = "/usr/bin/env amixer -D pulse sset Master 5%- && kill -USR1 #PID#";
