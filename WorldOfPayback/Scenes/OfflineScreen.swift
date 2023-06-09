//
//  OfflineScreen.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 30. 4. 2023..
//

import SwiftUI

struct OfflineScreen: View {
    var body: some View {
        VStack(spacing: 16) {
            Text(Content.transaction)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            ZStack {
                Color.red
                    .frame(height: 80)
                    .cornerRadius(16)
                    .padding(.horizontal)
                
                Text(Content.isDeviceOffline)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
            }
            
            Spacer()
            
            Text(Content.internetCheck)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 64)
    }
}
