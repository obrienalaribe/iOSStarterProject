//
//  AuthInterface.swift
//  ChurchFinder
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ success:Bool) -> Void

protocol AuthInterface {
    func register(user: User, completionHandler: @escaping CompletionHandler)
    func login(user: User, completionHandler: @escaping CompletionHandler)
}
