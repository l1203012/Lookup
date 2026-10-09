# Lookup

A browser that I've developed from forking multiple browsers and fitting to my needs.

Lookup starts from [Search](https://github.com/driceroland/Search) by Office Commun (MIT): a small, native macOS browser on WebKit, written in Swift. What this fork changes:

- **Tabs like Safari's Compact layout.** One row across the top; the tab you are on is the address field. No sidebar.
- **Runs on macOS 13 Ventura**, Intel included. Chrome extensions still need macOS 15.4 or later, as WebKit's extension engine does.
- **No self-update from Office Commun.** Lookup's builds come from this repository's GitHub Actions.

## Building

The app needs the Swift 6 toolchain (Xcode 16) to build, which itself needs macOS 14.5 or later. On an older Mac, use the **Build** workflow in GitHub Actions: it builds an Intel and an Apple Silicon `Lookup.app` and attaches them to the run as artifacts.

On a Mac with Xcode 16: `./build.sh` makes `build/Lookup.app`, ad-hoc signed. The first launch needs a right-click → Open.

The original project's README, with how everything is put together, is kept as [UPSTREAM.md](UPSTREAM.md).

## License

MIT, as the original. See [LICENSE](LICENSE).
