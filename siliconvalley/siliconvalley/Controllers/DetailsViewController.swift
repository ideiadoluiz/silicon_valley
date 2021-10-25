//
//  DetailsViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class DetailsViewController: BaseViewController {

    private(set) weak var episode: Episode?
    
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
        self.view.addSubview(DetailsView(frame: self.view.frame,
                                         episode: self.episode!))
    }
    
    private func setupNavBar() {
        // In case we had other views I could do it in a more generic way
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        self.navigationItem.title = String.localized(forKey: "details")
    }
}
