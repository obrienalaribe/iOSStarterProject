//
//  ChurchDelegateInterface.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

protocol ChurchFinderDelegateInterface {
    func churchModuleWillFindChurches()
    func churchModuleDidFindChurches(churches: Array<Church>)
}
