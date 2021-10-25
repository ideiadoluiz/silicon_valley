//
//  BaseViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // Keeping just one copy to the content
//    internal static let content = ContentLoader<[String: Any]>.GET().parse<>()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    init(key: String, systemName: String, tag: Int) {
        super.init(nibName: nil, bundle: nil)
        let item = UITabBarItem(title: String.localized(forKey: key),
                                image: UIImage(systemName: systemName),
                                tag: tag)
        self.tabBarItem = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    internal func setupUI() {
        self.view.backgroundColor = .white
    }
    
}
