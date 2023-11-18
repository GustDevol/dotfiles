use std::{fs::File, vec};
use std::process::Command;

mod config;
mod widget;
pub use config::*;
pub use widget::{Widget,Action};


impl WidgetType {
   pub fn value(&self) -> usize {
        *self as usize
    }
}


pub fn network() -> (WidgetType, Widget) {
    let ip_address = "1.1.1.1";

    let status = Command::new("/usr/bin/env")
        .arg("ping")
        .args(&["-c", "1", ip_address])
        .stdout(File::create("/dev/null").expect("Failed to open /dev/null"))
        .stderr(File::create("/dev/null").expect("Failed to open /dev/null"))
        .status()
        .expect("Network not reachable");

    let mut netcon = String::from("🌏 ");
    let mut color = String::new();
    if status.success() {
        netcon.push_str("📶");
        color.push_str(NETWORK_CONNECTED);
    } else {
        netcon.push_str("❌");
        color.push_str(NETWORK_DISCONNECTED);
    }

    ( WidgetType::Network, Widget::new(netcon, color) )
}


pub fn audio(device: String) -> (WidgetType, Widget) {
    let output = Command::new("/usr/bin/env")
        .arg("amixer")
        .args(&["-D", "pulse", "sget", device.as_str()])
        .output()
        .expect("Can't get Audio Info");

    let output_string = String::from_utf8_lossy(&output.stdout);
    let output_lines: Vec<&str> = output_string.split("\n  ").collect();
    let info_line = output_lines[output_lines.len() - 2]
        .replace("[", "").replace("]", "");
    let info: Vec<&str> = info_line.split_whitespace().collect();


    let (widget_type, mut volume) = if device == "Master" {
        (WidgetType::Speaker, "📢 ".to_string())
    } else {
        (WidgetType::Microphone, "🎤 ".to_string())
    };

    volume.push_str(info[info.len() - 2]);

    let color = match info[info.len() - 1] {
        "on" => String::from(AUDIO_UNMUTED),
        "off" => {
            volume = format!("%{{F{}}}{}%{{F-}}", AUDIO_MUTED, volume);
            String::from(AUDIO_MUTED)
        },
        _ => String::new()
    };

    ( widget_type, Widget::new(volume, color) )
}


pub fn battery() -> (WidgetType, Widget) {
    let output = Command::new("sh")
        .args(["-c", "~/.scripts/i3blocks/i3-battery"])
        .output()
        .expect("Can't get battery info, make sure acpi and script exists");

    let output_string = String::from_utf8_lossy(&output.stdout);
    let output_lines: Vec<&str> = output_string.split("\n").collect();

    let mut bat = String::from(output_lines[0]);
    let color = String::from(output_lines[2]);
    let mut bat_icon = String::new();
    let mut bat_info = String::new();

    if let Some(index) = bat.find(' ') {
        bat_icon.push_str(&bat[0..index]);
        bat_info.push_str(&bat[(index + 1)..]);
    }
    bat = format!("%{{F{}}}{}%{{F-}}{}", color, bat_icon, bat_info);

    ( WidgetType::Battery, Widget::new(bat, color) )
}


pub fn initialize_widgets() -> Vec<Widget> {
    // Initialize widgets with actions
    let mut network = Widget::new(String::new(), String::new());
    network.add_action(Action::new(
        String::from(NET_LEFT),
        String::from(NET_RIGHT),
        String::from(NET_SCROLL_UP),
        String::from(NET_SCROLL_DOWN)
    ));

    let mut battery = Widget::new(String::new(), String::new());
    battery.add_action(Action::new(
        String::from(BAT_LEFT),
        String::from(BAT_RIGHT),
        String::from(BAT_SCROLL_UP),
        String::from(BAT_SCROLL_DOWN)
    ));

    let mut speaker = Widget::new(String::new(), String::new());
    speaker.add_action(Action::new(
        String::from(SPK_LEFT),
        String::from(SPK_RIGHT),
        String::from(SPK_SCROLL_UP),
        String::from(SPK_SCROLL_DOWN)
    ));

    let mut microphone = Widget::new(String::new(), String::new());
    microphone.add_action(Action::new(
        String::from(MIC_LEFT),
        String::from(MIC_RIGHT),
        String::from(MIC_SCROLL_UP),
        String::from(MIC_SCROLL_DOWN)
    ));

    vec![network, battery, speaker, microphone]
}
