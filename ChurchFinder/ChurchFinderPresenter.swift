//
//  ChurchFinderPresenter.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

extension ChurchFinderController : ChurchFinderDelegateInterface {
    
    func churchModuleWillFindChurches() {
        print("churchModuleWillFindChurches")
    }
    
    func churchModuleDidFindChurches(churches: Array<Church>) {
        print("churchModuleDidFindChurches \(churches.count)")
        navigateToChurchResultPage(churches: churches)
    }
}
