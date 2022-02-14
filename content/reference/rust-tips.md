+++
title = "Rust Quick Tips"


aliases = [
  "420cbe5a"
]
+++

## cargo project commands

| command                        | description |
|--------------------------------|---|
| cargo run -- --arg --arg1 test | Run executable with commandline arguments |
| cargo test -- --nocapture      | Display stdout during testrun |
| cargo doc --no-deps            | Create documentation without dependencies |
| cargo doc --open               | Create local full documentation and open it in browser |
| cargo fmt                      | Format sourcecode in project |
| cargo tree                     | Show dependencie tree |

## cargo commands

| command                        | description |
|--------------------------------|---|
| cargo install [crate]          | Install [crate] |
| cargo uninstall [crate]        | Uninstall [crate] |
| cargo install --list           | List all installed crates |

## warning settings

```rs
#[warn(missing_debug_implementations, rust_2018_idioms, missing docs)]
```
