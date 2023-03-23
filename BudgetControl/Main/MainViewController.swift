//
//  MainViewController.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 22/03/23.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house.circle"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "add", image: UIImage(systemName: "plus.circle"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "charts", image: UIImage(systemName: "chart.pie"), tag: 2)

        tabBar.tintColor = .black
        tabBar.backgroundColor = UIColor(named: "tabBar")
        viewControllers = [vc1,vc2,vc3]
        
    }
}
