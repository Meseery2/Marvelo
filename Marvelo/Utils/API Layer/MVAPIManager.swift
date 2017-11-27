//
//  MVAPIManager.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import Foundation

struct MVApiManager{
    static let request = MVRequest(baseUrl: Config.baseUrl, privateKey: Config.Keys.marvelPrivate, publicKey: Config.Keys.marvelPublic)
}
