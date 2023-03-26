//
//  MainViewController.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 22/03/23.
//

import UIKit

class MainViewController: UITabBarController {
    
    let transactionViewController = TransactionViewController()
    let vc2 = UIViewController()
    let vc3 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        
        transactionViewController.tabBarItem = UITabBarItem(title: "transactions", image: UIImage(systemName: "bag.circle"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "add", image: UIImage(systemName: "plus.circle"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "charts", image: UIImage(systemName: "chart.pie"), tag: 2)
        vc2.view.backgroundColor = .red

        tabBar.tintColor = .red
        tabBar.barTintColor = UIColor(named: "tabBar")
        tabBar.backgroundColor = UIColor(named: "tabBar")
        
        let transactionNavigationController = UINavigationController(rootViewController: transactionViewController)
        viewControllers = [transactionNavigationController,vc2,vc3]
        
    }
}
