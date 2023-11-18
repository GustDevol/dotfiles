use std::thread;
use std::sync::mpsc;
use std::time::Duration;

mod widgets;
use signal_hook::consts::SIGUSR1;
use signal_hook::iterator::Signals;
use widgets::{network,audio,battery,initialize_widgets};
use widgets::*;


fn main() {
    // Status text that will be output to stdout
    let mut net_status = String::new();
    let mut bat_status = String::new();
    let mut spk_status = String::new();
    let mut mic_status = String::new();

    let mut status_widgets = initialize_widgets();
    let (tx, rx) = mpsc::channel();

    let tx1 = tx.clone();
    thread::spawn(move || {
        loop {
            tx1.send(network()).unwrap();
            thread::sleep(Duration::from_secs(NET_REPEAT_INTERVAL as u64));
        }
    });

    let tx2 = tx.clone();
    thread::spawn(move || {
        loop {
            tx2.send(battery()).unwrap();
            thread::sleep(Duration::from_secs(BAT_REPEAT_INTERVAL as u64));
        }
    });

    let tx3 = tx.clone();
    thread::spawn(move || {
        loop {
            tx3.send(audio(String::from("Master"))).unwrap();
            thread::sleep(Duration::from_secs(SPK_REPEAT_INTERVAL as u64));
        }
    });

    let tx4 = tx.clone();
    thread::spawn(move || {
        loop {
            tx4.send(audio(String::from("Capture"))).unwrap();
            thread::sleep(Duration::from_secs(MIC_REPEAT_INTERVAL as u64));
        }
    });

    thread::spawn(move || {
        let mut signals = Signals::new(&[SIGUSR1]).expect("Unable to create Signal iterator");

        for _ in signals.forever() {
            tx.send(network()).unwrap();
            tx.send(battery()).unwrap();
            tx.send(audio(String::from("Master"))).unwrap();
            tx.send(audio(String::from("Capture"))).unwrap();
        }
    });

    // Main thread looping forever
    loop {
        let (widget_type, widget) = rx.recv().unwrap();

        match widget_type {
           WidgetType::Network => {
                status_widgets[widget_type.value()].update(widget);
                net_status = status_widgets[widget_type.value()]
                    .widget_str().replace("#BG_ALT_COLOR#", BG_COLOR);
           },
           WidgetType::Battery => {
                status_widgets[widget_type.value()].update(widget);
                bat_status = status_widgets[widget_type.value()]
                    .widget_str().replace("#BG_ALT_COLOR#", BG_COLOR);
           },
           WidgetType::Speaker => {
                status_widgets[widget_type.value()].update(widget);
                spk_status = status_widgets[widget_type.value()]
                    .widget_str().replace("#BG_ALT_COLOR#", BG_COLOR);
           },
           WidgetType::Microphone => {
                status_widgets[widget_type.value()].update(widget);
                mic_status = status_widgets[widget_type.value()]
                    .widget_str().replace("#BG_ALT_COLOR#", BG_COLOR);
           },
        }
        
        if !net_status.is_empty() && !bat_status.is_empty() && 
                !spk_status.is_empty() && !mic_status.is_empty() {
            println!("  {} {} {} {}  ", net_status, spk_status, mic_status, bat_status);
        }
    }
}
