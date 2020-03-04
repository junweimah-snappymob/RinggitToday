//
//  FlagImageView.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 23/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct FlagImageView: View {
    var flagName = ""
    
    var body: some View {
        Image(flagName)
        .resizable()
        .frame(width: 50, height: 50)
        .clipShape(Circle())
    }
}

struct FlagImageView_Previews: PreviewProvider {
    static var previews: some View {
        FlagImageView()
    }
}
