//
//  PasswrdApp.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//

import SwiftUI

@main
struct PasswrdApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
        AppDelegate.shared = self.appDelegate
    }
    var body: some Scene {
        Settings {
            AboutView()
                .navigationTitle("About Passwrd")
        }
        
        if #available(macOS 14, *) {
            MenuBarExtra("Passwrd", systemImage: "key.fill"){
                ContentView()
            }
            .menuBarExtraStyle(.menu)
        }
    }
    
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusItem: NSStatusItem?
    static var shared : AppDelegate!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        if ProcessInfo.processInfo.operatingSystemVersion.majorVersion <= 13 {
            // Set up the menubar for macOS 13 and below
            statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
            
            // Setting up the button
            if let button = statusItem?.button {
                button.image = NSImage(systemSymbolName: "key", accessibilityDescription: nil)
                button.action = #selector(togglePopover(_:))
            }
            
            // Setting up the popover
            popover.animates = false
            popover.behavior = .transient
            popover.contentViewController = NSHostingController(rootView: EmptyView())
            popover.contentViewController?.view.window?.makeKey()
            
            // Create the menu
            let menu = NSMenu()
            
            // Add menu items
            let openPasswordSettingsItem = NSMenuItem(title: "Open Passwords", action: #selector(openPasswordSettings(_:)), keyEquivalent: "o")
            let showPreferencesItem = NSMenuItem(title: "About", action: #selector(showPreferences(_:)), keyEquivalent: "a")
            let quitAppItem = NSMenuItem(title: "Quit", action: #selector(quitApp(_:)), keyEquivalent: "q")
            
            menu.addItem(openPasswordSettingsItem)
            menu.addItem(showPreferencesItem)
            menu.addItem(quitAppItem)
            
            // Set the menu to the status item
            statusItem?.menu = menu
        }
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusItem?.button  {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
        
    }
    
    @objc func openPasswordSettings(_ sender: AnyObject?) {
            if let url = URL(string: "x-apple.systempreferences:com.apple.Passwords-Settings.extension") {
                NSWorkspace.shared.open(url)
            }
        
    }
    
    @objc func isSupportedVersion() -> Bool {
        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
        return osVersion.majorVersion >= 13
    }
    
    @objc func openLegacyPasswordSettings() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preferences.security?Privacy_Passwords") {
            NSWorkspace.shared.open(url)
        }
    }
    
    @objc func showPreferences(_ sender: AnyObject?) {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }
    
    @objc func quitApp(_ sender: AnyObject?) {
        NSApp.terminate(self)
    }
}
