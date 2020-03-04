//
//  ClearButtonModifier.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 27/02/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

public struct ClearButtonModifier: ViewModifier {
    @Binding var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            // onTapGesture is better than a Button here when adding to a form
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" }
        }
    }
}
