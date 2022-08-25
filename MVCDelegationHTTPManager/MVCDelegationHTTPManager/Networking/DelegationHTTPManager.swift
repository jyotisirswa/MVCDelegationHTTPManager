//
//  DelegationHTTPManager.swift
//  MVCDelegationHTTPManager
//
//  Created by Jyoti on 25/08/2022.
//

import Foundation

protocol DelegationHTTPDelegate : AnyObject {
    func didDownloadBreached(_ data : Data)
}

class DelegationHTTPManager {
    static let shared : DelegationHTTPManager = DelegationHTTPManager()
    var delegateHTTP : DelegationHTTPDelegate? = nil
    
    public func get (urlString : String) {
        if let urlObj = URL(string: urlString) {
            let urlRequest = URLRequest.init(url: urlObj)
            let taskGroup = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                self.delegateHTTP!.didDownloadBreached(data!)
            }
            taskGroup.resume()
        }
    }
}
