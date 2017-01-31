//
//  ChurchInteractor.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import MapKit

class ChurchInteractor {
    var delegate: ChurchFinderDelegateInterface!
    var dao: ChurchFinderDataInterface!
    
    init(dao: ChurchFinderDataInterface) {
        self.dao = dao
    }
    
    func fetchNearbyChurches() {
        if let location = Locator.shared.fetchUserLocation() {
            delegate.churchModuleWillFindChurches()
            
            dao.fetchChurches(near: location, completionHandler: { (result: Array<Church>) in
                if result != nil {
                    
                    self.delegate.churchModuleDidFindChurches(churches: result)
                }
            })
        }
    }
    
    
}
