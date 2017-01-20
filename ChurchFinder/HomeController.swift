//
//  HomeController.swift
//  ChurchFinder
//
//  Created by mac on 1/7/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ParentController: UIViewController {
    
    override func viewDidLoad() {
        
        let controller = HomeController()
        let controllerView = controller.view
//        controllerView!.frame = CGRect(x: 30, y: 0, width: view.frame.width/2, height: view.frame.height - 100)
        self.view.addSubview(controllerView!)

        controllerView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        controllerView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        controllerView?.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        
        controllerView?.heightAnchor.constraint(equalToConstant: 100).isActive = true

        controllerView?.translatesAutoresizingMaskIntoConstraints = false
        
        controller.willMove(toParentViewController: self)
        self.addChildViewController(controller)
        controller.didMove(toParentViewController: self)
        
    }
}

class HomeController: UIPageViewController, UIPageViewControllerDataSource {
    
   
    var homeContentController: HomeContentController!
    
    let content = ["sdsdf", "sdfsdf", "dffdg"]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        
         super.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: options)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeContentController = HomeContentController()
        
        dataSource = self
        
        let viewControllers = [(homeContentController as! UIViewController)]
        

        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        
        var pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = Asset.Styles.primary.color
        pageControl.currentPageIndicatorTintColor = Asset.Styles.secondary.color
        pageControl.backgroundColor = Asset.Styles.primaryDark.color
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("in before")
        let controller = HomeContentController()
        controller.content = "Find churches around your location"
        controller.infographic.image = Asset.Icon.search.image
        return controller
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let controller = HomeContentController()
        controller.content = "View analytics of your members in portal"
        controller.infographic.image = Asset.Icon.analytics.image
        return controller
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.content.count ?? 0
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}


    class HomeContentController: UIViewController {
        
        var infographic : UIImageView = {
            let iv = UIImageView()
            iv.image = Asset.Icon.logo.image
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        let contentLabel : UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = Asset.Styles.secondary.color
            label.numberOfLines = 3
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        var content: String? {
            didSet {
                contentLabel.text = content
            }
        }
        
        override func viewDidLoad() {
            view.backgroundColor = Asset.Styles.primary.color
            
            
            view.addSubview(contentLabel)
            view.addSubview(infographic)
            
            infographic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infographic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
            infographic.heightAnchor.constraint(equalToConstant: 150).isActive = true
            infographic.widthAnchor.constraint(equalToConstant: 150).isActive = true
            

            contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            contentLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
            
            contentLabel.topAnchor.constraint(equalTo: infographic.bottomAnchor, constant: 30).isActive = true
            
            
        }
        

        
    }
    
