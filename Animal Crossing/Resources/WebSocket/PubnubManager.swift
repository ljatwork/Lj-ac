//
//  PubnubManager.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/27/20.
//

import Foundation
import UIKit
import PubNub

class PubNubManager {
    static let shared = PubNubManager()
    let listener = SubscriptionListener(queue: .main)
    var client: PubNub!
    
    func initPubNub(uuid: String) {
        PubNub.log.levels = [.all]
        PubNub.log.writers = [ConsoleLogWriter(), FileLogWriter()]
        
        // Initialize and configure PubNub client instance
        let configuration = PubNubConfiguration(publishKey: Constants.PUBNUB_PUBLISH_KEY, subscribeKey: Constants.PUBNUB_SUBSCRIBE_KEY, uuid: uuid)
        client = PubNub(configuration: configuration)
        
    }
    
    func subscribeToChannel() {
        client.subscribe(to: [Constants.PUBNUB_CHANNEL], withPresence: true)
    }
    
    func unsubscribeToChannel() {
        client.unsubscribe(from: [Constants.PUBNUB_CHANNEL])
    }
    
    func publishMessage(_ message: String) {
        client.publish(channel: Constants.PUBNUB_CHANNEL, message: message) { result in
          switch result {
          case let .success(timetoken):
            debugPrint("The message was successfully published at: \(timetoken)")
          case let .failure(error):
            debugPrint("Handle response error: \(error.localizedDescription)")
          }
        }
    }
    
    func fetchHistory() {
        client.fetchMessageHistory(for: [Constants.PUBNUB_CHANNEL]) { result in
          switch result {
          case let .success((messagesByChannelId, nextPage)):
            debugPrint("Successful History Fetch Response: \(messagesByChannelId)")
            debugPrint("The start/end values for the next page: \(String(describing: nextPage))")
          case let .failure(error):
            debugPrint("Failed History Fetch Response: \(error.localizedDescription)")
          }
        }
    }
}
