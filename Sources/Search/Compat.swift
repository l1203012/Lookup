import SwiftUI

// Lookup runs on macOS 13. What Search took from macOS 14 is filled in here,
// or behind an #available where it is used.

extension View {
    /// `onChange(of:initial:) { old, new in }`, which is macOS 14's. On 13
    /// the old value is the one the closure captured when the view was last
    /// drawn, and `initial` runs it once as the view appears.
    func whenChanged<V: Equatable>(of value: V, initial: Bool = false, _ action: @escaping (V, V) -> Void) -> some View {
        modifier(WhenChanged(value: value, initial: initial, action: action))
    }
}

private struct WhenChanged<V: Equatable>: ViewModifier {
    let value: V
    let initial: Bool
    let action: (V, V) -> Void

    func body(content: Content) -> some View {
        if #available(macOS 14, *) {
            content.onChange(of: value, initial: initial) { old, new in action(old, new) }
        } else {
            content
                .onChange(of: value, perform: { [value] new in action(value, new) })
                .onAppear { if initial { action(value, value) } }
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
