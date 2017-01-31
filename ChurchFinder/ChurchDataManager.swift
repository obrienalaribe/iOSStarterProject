//
//  ChurchDataManager.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import CoreLocation

typealias ResultCompletionHandler<T> = (_ result: Array<T>) -> Void


class ChurchDataManager: ChurchFinderDataInterface {
    func fetchChurches(near: CLLocation, completionHandler: @escaping ResultCompletionHandler<Church>) {
        
        
        let churches = [DataFactory.ChurchModel.EFA.object, DataFactory.ChurchModel.PC.object]
        
        completionHandler(churches)
    }
}
