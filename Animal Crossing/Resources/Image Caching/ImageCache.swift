//
//  ImageCache.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import UIKit
import Foundation
import Combine

public class ImageCache {
    
    public static let publicCache = ImageCache()
    var placeholderImage = Asset.update.image
    private let cachedImages = NSCache<NSURL, UIImage>()
    private var loadingResponses = [URL: [(UIImage?) -> ()]]()
    private var cancellable: AnyCancellable?
    
    public final func image(url: URL) -> UIImage? {
        if let newURL = NSURL(string: url.absoluteString) {
            return cachedImages.object(forKey: newURL)
        }
        return nil
    }
    
    // Returns the cached image if available, otherwise asynchronously loads and caches it.
    final func load(url: URL, completion: @escaping (UIImage?) -> Void) {
        // Check for a cached image.
        if let cachedImage = image(url: url) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }
        // In case there are more than one requestor for the image, we append their completion block.
        if loadingResponses[url] != nil {
            loadingResponses[url]?.append(completion)
            return
        } else {
            loadingResponses[url] = [completion]
        }
        // Go fetch the image.
        
        // set configuration timeout
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(15)
        configuration.timeoutIntervalForResource = TimeInterval(15)
        
        // Go fetch the image.
        let urlSession = URLSession(configuration: configuration, delegate: nil, delegateQueue: .main)
            urlSession.dataTask(with: url as URL) { (data, response, error) in
                
            // Check for the error, then data and try to create the image.
            guard let responseData = data, let image = UIImage(data: responseData),
                let blocks = self.loadingResponses[url], error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            // Cache the image.
            if let newURL = NSURL(string: url.absoluteString) {
                self.cachedImages.setObject(image, forKey: newURL, cost: responseData.count)
            }
            // Iterate over each requestor for the image and pass it back.
            for block in blocks {
                DispatchQueue.main.async {
                    block(image)
                }
                return
            }
        }.resume()
    }
        
}
