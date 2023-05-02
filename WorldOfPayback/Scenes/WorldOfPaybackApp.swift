//
//  WorldOfPaybackApp.swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 27. 4. 2023..
//

import SwiftUI
import Network

@main
struct WorldOfPayback: App {
    @State private var isDeviceOnline = true
    
    var body: some Scene {
        WindowGroup {
            if isDeviceOnline {
                NavigationView {
                    TransactionsList()
                }
                .onAppear {
                    monitorDeviceOnlineStatus()
                }
            } else {
                OfflineScreen()
            }
        }
    }
    
    private func monitorDeviceOnlineStatus() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isDeviceOnline = path.status == .satisfied
            }
        }
    }
}
