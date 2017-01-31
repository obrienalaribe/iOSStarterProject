//
//  ChurchController.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ChurchFinderController: UIViewController {

    var mainView : ChurchFinderView!
    var interactor = ChurchInteractor(dao: ChurchDataManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = ChurchFinderView(parent: self.view)
        interactor.delegate = self
        
        self.view.addSubview(mainView)

        mainView.findBtn.addTarget(self, action: #selector(ChurchFinderController.findBtnAction), for: .touchUpInside)
    }

    func findBtnAction(){
        interactor.fetchNearbyChurches()
    }
}
