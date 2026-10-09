import SwiftUI

// Lookup runs on macOS 13. What Search took from macOS 14 is filled in here,
// or behind an #available where it is used.

extension View {
    /// `onChange(of:) { old, new in }`, which is macOS 14's. On 13 the old
    /// value is the one the closure captured when the view was last drawn.
    func whenChanged<V: Equatable>(of value: V, _ action: @escaping (V, V) -> Void) -> some View {
        modifier(WhenChanged(value: value, action: action))
    }
}

private struct WhenChanged<V: Equatable>: ViewModifier {
    let value: V
    let action: (V, V) -> Void

    func body(content: Content) -> some View {
        if #available(macOS 14, *) {
            content.whenChanged(of: value) { old, new in action(old, new) }
        } else {
            content.whenChanged(of: value) { [value] new in action(value, new) }
        }
    }
}

extension Text {
    /// A placeholder's colour: `foregroundStyle` on a Text is macOS 14's.
    func inked(_ color: Color) -> Text {
        if #available(macOS 14, *) { return foregroundStyle(color) }
        return foregroundColor(color)
    }
}

extension NSApplication {
    /// `activate()` is macOS 14's.
    func bringForward() {
        if #available(macOS 14, *) { activate() } else { activate(ignoringOtherApps: true) }
    }
}
