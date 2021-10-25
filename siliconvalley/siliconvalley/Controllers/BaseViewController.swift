//
//  BaseViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(key: String, systemName: String, tag: Int) {
        super.init(nibName: nil, bundle: nil)
        let item = UITabBarItem(title: String.localized(forKey: key),
                                image: UIImage(systemName: systemName),
                                tag: tag)
        self.tabBarItem = item
    }
    
    internal func setupUI() {
        self.view.backgroundColor = .white
    }
    
}
