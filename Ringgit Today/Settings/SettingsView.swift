//
//  SettingsView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var settings = ["Privacy Policy", "Credits"]
    
    // level 2
    var settingsLevel2PrivacyPolicy = ["Privacy Policy"]
    var settingsLevel2Credit = ["API by exchangeratesapi.io", "Icons by flaticon.com"]
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(settings, id: \.self) { setting in
                    NavigationLink(destination: self.destination(for: setting)) {
                            Text("\(setting)")
                    }
                }
            }
        .navigationBarTitle("Settings")
        }
    }
    
    private func destination (for setting: String) -> SettingsLevel2View {
        if setting == "Privacy Policy" {
            return SettingsLevel2View(rows: self.settingsLevel2PrivacyPolicy, title: settings[0])
        } else {
            return SettingsLevel2View(rows: self.settingsLevel2Credit, title: settings[0])
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
