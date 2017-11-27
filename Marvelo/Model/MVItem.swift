//
//  MVItem.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import Foundation

struct MVItem{
    var name: String
    var resourceURI: URL
}

func ==(a: MVItem, b: MVItem) -> Bool {
    return a.hashValue == b.hashValue
}
extension MVItem: Hashable{
    
    private static let hashPrefix = "Item"
    var hashValue: Int {
        return "\(MVItem.hashPrefix)\(name.hashValue)".hashValue
    }
}

class MVItemMapper: MVBaseMapper<MVItem>{
    
    private static let nameKey = "name"
    private static let resourceURIKey = "resourceURI"
    
    
    override class func createObjectFrom(dictionary: Dictionary<String, Any> ) -> MVItem?{
        
        if let name =  dictionary[ nameKey ] as? String{
            let resourceURI =            URL(string:dictionary[resourceURIKey] as! String)

            return MVItem(name: name, resourceURI: resourceURI!)
            
            
        }
        
        
        return super.createObjectFrom(dictionary: dictionary)
    }
}
