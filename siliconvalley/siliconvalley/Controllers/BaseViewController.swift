//
//  BaseViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

internal class FavoriteMemoization {
    private static var savedFavorites = [Int: Bool]()
    
    static func getFavorite(_ hash: Int) -> Bool? {
        return savedFavorites[hash]
    }
    
    static func setFavorite(_ hash: Int, _ isFavorite: Bool) {
        savedFavorites[hash] = isFavorite
    }
}

class BaseViewController: UIViewController {
    
    // Keeping just one copy for the example
    internal static let contentShow = ContentLoader<[String: AnyObject]>.GET()?.parse(p: Show.self) as! Show
    
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
 
    internal func toggleIsFavorite(hash : Int) {
        if let isFavorite = FavoriteMemoization.getFavorite(hash) {
            FavoriteMemoization.setFavorite(hash, !isFavorite)
        } else {
            FavoriteMemoization.setFavorite(hash, true)
        }
    }
    
    internal func pushDetailsController(episode: Episode) {
        let controller = DetailsViewController(episode: episode)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
