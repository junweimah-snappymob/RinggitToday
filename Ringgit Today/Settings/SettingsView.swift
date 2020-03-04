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
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(settings, id: \.self) { setting in
                    NavigationLink(destination: CreditsView()) {
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
