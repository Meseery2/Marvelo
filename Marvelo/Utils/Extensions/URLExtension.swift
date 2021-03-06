//
//  URLExtension.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import Foundation

extension URL{
    func URLByAppendingQueryParams(params:[String: Any])->URL{
        if var components=URLComponents(url: self, resolvingAgainstBaseURL: true){
            
            var queryItems=[URLQueryItem]()
            for (key, value) in params {
                let stringValue = "\(value)"
                let queryItem=URLQueryItem(name: key, value: stringValue)
                queryItems.append(queryItem)
            }
            components.queryItems=queryItems
            if let url=components.url{
                return url
            }
        }
        return self
    }
    
    static func fromString(urlString: String?) -> URL? {
        if urlString != nil {
            return URL(string: urlString!)
        }
        return nil
    }
}
