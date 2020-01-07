//
//  SocketIOTesting.swift
//  SocketIOTesting
//
//  Created by Kimleang Kea on 1/5/20.
//  Copyright © 2020 Kimleang Kea. All rights reserved.
//

import Foundation
import SocketIO

class SocketTestingManager {
    
    static let shared = SocketTestingManager()
    
    static let manager = SocketManager(socketURL: URL(string: "http://localhost:9001")!, config: [.log(false)])
    let socket = manager.defaultSocket
    
    func connect(handler: @escaping () -> Void) {
        socket.on(clientEvent: .connect) { (data, ack) in
            handler()
        }
    }
    
    func connect() {
        socket.connect()
    }
    
    func typing(text: String) {
        socket.emit("typing", text)
    }
    
    func typing(handler: @escaping (String) -> Void) {
        socket.on("typingMessage") { (data, ack) in
            print(data)
            handler(data[0] as! String)
        }
    }
    
}
