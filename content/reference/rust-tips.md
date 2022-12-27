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

## cargo plugins

| plugin | description |
|---|---|
| expand | expand Rust macros |
| outdated | check for outdated dependencies |
| bloat | space used by functions in executable |
| audit | check for security vulnerabilities in libs |
| deb | create debian package |

## warning settings

See also the [Lint Listing](https://doc.rust-lang.org/rustc/lints/listing/index.html)
in the Rust Documentation

```rs
#[warn(missing_debug_implementations)]
#[warn(missing_docs)]
```
