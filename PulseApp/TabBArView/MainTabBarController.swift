//
//  MainTabBarControllerViewController.swift
//  PulseApp
//
//  Created by Влад on 29.11.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем экземпляры контроллеров для каждой вкладки
        let heartVC = HeartController()
        let historyVC = HistoryController()
        let dietVC = DietController()
        let testVC = TestController()
        let profileVC = ProfileController()
        
        // Настраиваем изображения для вкладок
        heartVC.tabBarItem = UITabBarItem(title: "Heart", image: UIImage(named: "NoSelectHeartTabBar"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "NoSelectHistoryTabBar"), tag: 1)
        dietVC.tabBarItem = UITabBarItem(title: "Diet", image: UIImage(named: "NoSelectDietTabBar"), tag: 2)
        testVC.tabBarItem = UITabBarItem(title: "Test", image: UIImage(named: "NoSelectProfileTabBar"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "NoSelectTestTabBar"), tag: 4)
        
        // Устанавливаем контроллеры во вкладки
        viewControllers = [heartVC, historyVC, dietVC, testVC, profileVC]
        
        setViewControllers(viewControllers, animated: true)
        
        // Настраиваем внешний вид Tab Bar
        self.tabBar.barTintColor = .lightGray
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .gray
        
        // Настраиваем закругление Tab Bar
        self.tabBar.layer.cornerRadius = 10
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.clipsToBounds = true
    }
    //MARK: - Tab setup
    
    private func setupTabs(){
        
    }
}
