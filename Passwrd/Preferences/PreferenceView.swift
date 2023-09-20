//
//  PreferenceView.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//

import SwiftUI

struct PreferenceView: View {
    private enum Tabs: Hashable {
        case general, about
    }
    var body: some View {
        TabView {
            GeneralView()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
                .tag(Tabs.general)
            AboutView()
                .tabItem {
                    Label("About", systemImage: "heart")
                }
                .tag(Tabs.about)
        }
       
    }
}
