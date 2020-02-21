//
//  ContentView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RatesView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Rates")
                }

            ConverterView()
                .tabItem {
                    Image(systemName: "repeat")
                    Text("Converter")
                }
            
            SettingsView()
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
