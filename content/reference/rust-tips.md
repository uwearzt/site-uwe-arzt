+++
title = "Rust Quick Tips"


aliases = [
  "420cbe5a"
]
+++

# cargo commands

| command                        | description |
|--------------------------------|-|
| cargo run -- --arg --arg1 test | Run executable with commandline arguments |
| cargo test -- --nocapture      | Display stdout during testrun (can be helpful for debugging) |
| cargo doc --no-deps            | Create documentation without dependencies |
| cargo doc --open               | Create local full documentation and open it in browser |
| cargo install rustfmt          | Install rust formatter |
| cargo fmt                      | Format sourcecode in project |
| cargo install --list           | list all installed crates |

# warning settings

```rust
#[warn(missing_debug_implementations, rust_2018_idioms, missing docs)]
```
