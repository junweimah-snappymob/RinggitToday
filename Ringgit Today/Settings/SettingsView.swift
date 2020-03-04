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
    var settingsLevel2PrivacyPolicy = ["Privacy Policy", "Privacy Policy"]
    var settingsLevel2Credit = ["API by", "Icons by"]
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(settings, id: \.self) { setting in
                        NavigationLink(destination: SettingsLevel2View(rows: self.settingsLevel2PrivacyPolicy, title: "")) {
                            Text("\(setting)")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
