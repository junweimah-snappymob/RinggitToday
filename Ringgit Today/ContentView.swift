//
//  ContentView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 21/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var service: CurrencyService

    var body: some View {
        TabView {
            RatesView().environmentObject(service)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Rates")
                }

            ConverterView().environmentObject(service)
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
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: service.fetchCurrency)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
