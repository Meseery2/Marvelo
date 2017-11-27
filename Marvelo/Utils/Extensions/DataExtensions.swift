//
//  DataExtensions.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import Foundation

extension Data {
    func toDictionary() -> [String: Any]? {
        let jsonError: NSError?
        do{
            if let dict = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, Any> {
                return dict
            }
        }catch let error as NSError {
            jsonError = error
            print(jsonError as Any)
        }
        return nil
    }
}
