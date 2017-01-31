//
//  ChurchInterface.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import CoreLocation


protocol ChurchFinderDataInterface {
    func fetchChurches(near: CLLocation, completionHandler: @escaping ResultCompletionHandler<Church>)
}
