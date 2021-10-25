//
//  DetailsViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class DetailsViewController: BaseViewController {

    private(set) weak var episode: Episode?
    private weak var detailsView: DetailsView?
    
    init(episode: Episode) {
        super.init()
        self.episode = episode
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupUI() {
        super.setupUI()
        self.setupNavBar()
        let detailsView = DetailsView(frame: self.view.frame,
                                      episode: self.episode!,
                                      favorite: FavoriteMemoization.getFavorite(self.episode!.name!.hashValue) ?? false,
                                      target: self,
                                      action:#selector(toggle(sender:)))
        self.detailsView = detailsView
        self.view.addSubview(detailsView)
    }
    
    private func setupNavBar() {
        // In case we had other views I could do it in a more generic way
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        self.navigationItem.title = String.localized(forKey: "details")
    }
    
    @objc func toggle(sender: UIButton) {
        self.toggleIsFavorite(hash: sender.tag)
        self.detailsView?.updateButton(favorite: FavoriteMemoization.getFavorite(sender.tag) ?? false)
    }
}
