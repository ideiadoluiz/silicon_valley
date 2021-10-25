//
//  SectionView.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class SectionView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, season: Int) {
        super.init(frame: frame)
        let mainView = setupMainView()
        setupTitle(mainView, season)
    }
    
    private func setupMainView() -> UIView {
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.backgroundColor = Color.navBarBlue
        
        UIView.addFitContraints(to: view, from: self)
        return view
    }
    
    private func setupTitle(_ view:UIView, _ title: Int) {
        let titleStr = String.localized(forKey: "season")
        let value = "\(titleStr): \(title)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 5)
    }
    
}
