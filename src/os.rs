pub enum OS {
    Mac,
    Ubuntu
}

pub fn get_os() -> OS {
    if cfg!(target_os = "macos") {
        OS::Mac;
    }
    OS::Ubuntu
}