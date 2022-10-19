//
//  NetworkManager.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit
/*
 * Implemented https://matteomanferdini.com/network-requests-rest-apis-ios-swift/
 */
protocol NetworkManager: AnyObject {
    var key: String { get }
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkManager {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30
        request.setValue(key, forHTTPHeaderField: "X-API-KEY")
        request.setValue("1.3.0", forHTTPHeaderField: "Accept-Version")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let newData = data else {
                completion(nil)
                return
            }
            if let strData = String(data: newData, encoding: .utf8) {
                // the data will be converted to the string
                debugPrint("str data >> \(strData)")
            }
            completion(self.decode(newData))
        }
        task.resume()
    }
}

extension APIRequest: NetworkManager {
    var key: String {
        return "5c64c28b-2792-4ac2-8009-e6738c93bacc"
    }
    
    func decode(_ data: Data) -> Resource.ModelType? {
        do {
            let decoder = JSONDecoder()
            let photos = try decoder.decode(Resource.ModelType.self, from: data)
            return photos
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    func load(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}


class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.nookipedia.com/")!
        components.path = methodPath
        components.queryItems = queryItems
        return components.url!
    }
}
