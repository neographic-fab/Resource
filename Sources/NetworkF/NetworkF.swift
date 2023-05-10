//
//  File.swift
//  
//
//  Created by Fabio Floris on 10/05/23.
//

import Foundation
import Network

public class NetworkManager: ObservableObject {
    private let queue = DispatchQueue(label: "monitor")
    private let monitor = NWPathMonitor()
    public var isConnected = true
    
    public init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        monitor.start(queue: queue)
    }
}

