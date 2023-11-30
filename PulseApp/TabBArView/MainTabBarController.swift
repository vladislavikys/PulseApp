import UIKit
class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    //MARK: - Tab setup

    private func setupTabs() {
        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.backgroundColor = .white
        self.view.insertSubview(backgroundImage, at: 0)

        // Создаем экземпляры контроллеров для каждой вкладки
        let heartVC = HeartController()
        let historyVC = HistoryController()
        let dietVC = DietController()
        let testVC = TestController()
        let profileVC = ProfileController()

        // Настраиваем изображения для вкладок
        heartVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "HeartTabBar"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "HistoryTabBar"), tag: 1)
        dietVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "DietTabBar"), tag: 2)
        testVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "ProfileTabBar"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TestTabBar"), tag: 4)

        // Устанавливаем контроллеры во вкладки
        viewControllers = [heartVC, historyVC, dietVC, testVC, profileVC]

        // Настраиваем внешний вид Tab Bar
        self.tabBar.barTintColor = .blue
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .gray

        // Настраиваем закругление Tab Bar
        self.tabBar.layer.cornerRadius = 10
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.clipsToBounds = true
        
    }
}
