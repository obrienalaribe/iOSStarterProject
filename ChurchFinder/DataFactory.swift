//
//  DataFactory.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation

enum DataFactory {
    enum ChurchModel {
        case EFA
        case PC
        
        var object: Church {
            switch(self) {
            case .EFA:  return Church(name: "EFA", address: "12-14 Walter Street", postcode: "LS4 2BB")
            case .PC:  return Church(name: "PC", address: "233 Meanwood road", postcode: "LS1 9BB")
            }
        }
        
    }
}
