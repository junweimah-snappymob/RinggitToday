//
//  CreditsView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 23/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        Form() {
            Text("API by exchangeratesapi.io")
            
            Text("API by exchangeratesapi.io")
                
        }
        .navigationBarTitle("Credits", displayMode: .inline)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
