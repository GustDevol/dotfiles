pub use action::Action;

#[allow(dead_code)]
#[derive(Debug)]
pub struct Widget {
    value: String,
    ulcolor: String,
    actions: Action
}


mod action {
    #[allow(dead_code)]
    #[derive(Debug)]
    pub struct Action {
        left: String,
        right: String,
        scrollup: String,
        scrolldown: String
    }


    impl Action {
        pub fn new(left: String, right: String, scrollup: String, scrolldown: String) -> Action {
            Action { left, right, scrollup, scrolldown }
        }

        pub fn action_string(&self) -> String {
            let mut actions = String::from("#STATUS#");

            let pid: u32 = std::process::id();
            
            actions = if !self.scrolldown.is_empty() { format!("%{{A5:{}:}}{}%{{A}}", self.scrolldown, actions) } else {actions};
            actions = if !self.scrollup.is_empty() { format!("%{{A4:{}:}}{}%{{A}}", self.scrollup, actions) } else {actions};
            actions = if !self.right.is_empty() { format!("%{{A3:{}:}}{}%{{A}}", self.right, actions) } else {actions};
            actions = if !self.left.is_empty() { format!("%{{A:{}:}}{}%{{A}}", self.left, actions) } else {actions};

            return actions.replace("#PID#", pid.to_string().as_str())
        }
    }
}


impl Widget {
    pub fn new(value: String, ulcolor: String) -> Widget {
        let actions = Action::new(
            String::new(),
            String::new(),
            String::new(),
            String::new()
        );
        Widget {value, ulcolor, actions}
    }


    pub fn add_action(&mut self, actions: Action) {
        self.actions = actions;
    }


    pub fn update(&mut self, widget: Widget) {
        self.value = widget.value;
        self.ulcolor = widget.ulcolor;
    }


    pub fn widget_str(&self) -> String {
        let action_string = self.actions.action_string();
        let status = action_string.replace("#STATUS#", self.value.as_str());
        format!("%{{B#BG_ALT_COLOR#}}%{{U{}}}%{{+u}} {} %{{-u}}%{{U-}}%{{B-}}", self.ulcolor, status)
    }
}
