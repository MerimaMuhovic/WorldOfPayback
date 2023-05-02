//
//  LoadingSpinner.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 2. 5. 2023..
//

import SwiftUI

struct LoadingSpinner: View {
    let isLoading: Bool
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.4)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(isLoading ? 1 : 0)
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .padding(40)
                    .cornerRadius(20)
            }
        }
    }
}

