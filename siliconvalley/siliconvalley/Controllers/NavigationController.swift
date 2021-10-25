//
//  NavigationController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

/*
 * Note: I didn't really need to create the navigation controller,
 * but I decided to do it anyways so I could easily change things,
 * if needed in the future and also to remove some code from the SceneDelegate
 */
internal class NavigationController: UINavigationController {
    
    internal static var defaultController: NavigationController {
        return NavigationController(rootViewController: TabBarController.defaultController)
    }
    
}
