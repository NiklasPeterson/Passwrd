//
//  ContentView.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//

import SwiftUI
import LaunchAtLogin

struct ContentView: View {
    var body: some View {
        VStack() {
            Button("Open Passwords") {
                openPasswordSettings()
            }.keyboardShortcut("o")
            
            SettingsLink{
                Text("About")
            }.keyboardShortcut("a")
            
            Divider()

            LaunchAtLogin.Toggle()
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
    }
}

private func openPasswordSettings() {
    if isSupportedVersion() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.Passwords-Settings.extension") {
            NSWorkspace.shared.open(url)
        }
    } else {
        openLegacyPasswordSettings()
    }
}

private func isSupportedVersion() -> Bool {
    let osVersion = ProcessInfo.processInfo.operatingSystemVersion
    return osVersion.majorVersion >= 13
}

private func openLegacyPasswordSettings() {
    if let url = URL(string: "x-apple.systempreferences:com.apple.preferences.security?Privacy_Passwords") {
        NSWorkspace.shared.open(url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
