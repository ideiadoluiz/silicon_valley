//
//  TabBarController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

/*
 * Note: I didn't really need to create the tab bar controller,
 * but I decided to do it anyways so I could easily change things,
 * if needed in the future and also to remove some code from the SceneDelegate
 */
class TabBarController: UITabBarController {
    
    private enum TabType: Int {
        case Episodes = 0
        case Favorites
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
    }
    
    internal func setupNavBar() {
        self.navigationItem.title = String.localized(forKey: "silicon_valley")
    }
    
    internal static var defaultController: TabBarController {
        let controller = TabBarController()
        let list = ListViewController(key: "episodes",
                                      systemName: "list.bullet",
                                      tag: TabType.Episodes.rawValue)
        let favorites = FavoritesViewController(key: "favorites",
                                                systemName: "star.fill",
                                                tag: TabType.Episodes.rawValue)
        controller.viewControllers = [ list, favorites ]
        controller.selectedViewController = list
        return controller
    }
}
