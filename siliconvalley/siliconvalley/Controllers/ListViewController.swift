//
//  ViewController.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

class ListViewController: BaseViewController {
    
    override func setupUI() {
        super.setupUI()
        
        let btn = UIButton(frame: CGRect(x: 0, y: 500, width: 100, height: 50))
        btn.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        btn.setTitle("Jaca", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        
        self.view.addSubview(btn)
    }

    @objc private func pressed() {
        self.navigationController?.pushViewController(DetailsViewController(),
                                                      animated: true)
    }
    

}

