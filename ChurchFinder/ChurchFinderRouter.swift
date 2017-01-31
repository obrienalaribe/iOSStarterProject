//
//  ChurchFinderRouter.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

extension ChurchFinderController: ChurchFinderRouterInterface {
    func navigateToChurchResultPage(churches: Array<Church>) {
        let navigationController = UINavigationController(rootViewController: ChurchResultController(churches: churches))
       self.present(navigationController, animated: true, completion: nil)
    }
}
