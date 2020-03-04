//
//  SettingsLevel2View.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 04/03/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct SettingsLevel2View: View {
    var rows: [String] = []
    var title: String = ""

    var body: some View {
        Form() {
            ForEach(rows, id: \.self) {
                Text($0)
            }
        }
        .navigationBarTitle("title", displayMode: .inline)
    }
}

struct SettingsLevel2View_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLevel2View()
    }
}
