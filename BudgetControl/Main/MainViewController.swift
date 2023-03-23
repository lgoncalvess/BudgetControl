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
        let vc1 = TransactionViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house.circle"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "add", image: UIImage(systemName: "plus.circle"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "charts", image: UIImage(systemName: "chart.pie"), tag: 2)
        vc2.view.backgroundColor = .red

        tabBar.tintColor = .black
        tabBar.barTintColor = UIColor(named: "tabBar")
        tabBar.backgroundColor = UIColor(named: "tabBar")
        let summaryNC = UINavigationController(rootViewController: vc1)
        viewControllers = [summaryNC,vc2,vc3]
        
    }
}
