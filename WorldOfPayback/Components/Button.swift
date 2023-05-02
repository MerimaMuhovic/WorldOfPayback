//
//  Button.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 2. 5. 2023..
//

import SwiftUI

struct FilterButtonStyle: ButtonStyle {
    let selected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundColor(selected ? .white : .blue)
            .background(selected ? Color.blue : Color.white)
            .cornerRadius(20)
            .font(.caption)
    }
}

extension Button {
    func filterButtonStyle(selected: Bool) -> some View {
        self.buttonStyle(FilterButtonStyle(selected: selected))
    }
}

