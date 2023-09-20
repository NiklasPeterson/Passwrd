//
//  GeneralView.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//

import SwiftUI
import LaunchAtLogin

struct GeneralView: View {
    //    @State private var hideDockIcon = UserDefaults.standard.bool(forKey: "HideDockIcon")
//    @State private var hideDockIcon = NSApp.activationPolicy() == .accessory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            LaunchAtLogin.Toggle()
            
//            Toggle(isOn: $hideDockIcon) {
//                Text("Hide Dock Icon")
//            }
//            .onChange(of: hideDockIcon) {
//                let newActivationPolicy: NSApplication.ActivationPolicy = hideDockIcon ? .accessory : .regular
//                NSApp.setActivationPolicy(newActivationPolicy)
//                UserDefaults.standard.set(hideDockIcon, forKey: "HideDockIcon")
//            }
            
            //                .onChange(of: hideDockIcon) {
            //                    UserDefaults.standard.set(hideDockIcon, forKey: "HideDockIcon")
            //                    NSApp.setActivationPolicy(hideDockIcon ? .accessory : .regular)
            //                }
            
        }
//        .onAppear {
//            // Set the initial state of the toggle based on the current activation policy
//            hideDockIcon = NSApp.activationPolicy() == .accessory
//        }
        .frame(width: 480, height: 200)
        .padding()
    }
    
}
struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
