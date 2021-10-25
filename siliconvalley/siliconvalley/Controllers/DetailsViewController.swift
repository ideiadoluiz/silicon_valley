//
//  DetailsViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class DetailsViewController: BaseViewController {

    override func setupUI() {
        super.setupUI()
        self.setupNavBar()
    }
    
    private func setupNavBar() {
        // In case we had other views I could do it in a more generic way
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        self.navigationItem.title = String.localized(forKey: "details")
    }
}
