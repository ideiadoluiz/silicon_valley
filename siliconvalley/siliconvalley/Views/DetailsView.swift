//
//  DetailsView.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import Foundation

import UIKit

class DetailsView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, episode: Episode) {
        super.init(frame: frame)
        let mainView = setupMainView()
        setupImage(episode.image.medium!)
    }
    
    private func setupMainView() -> UIView {
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        UIView.addFitContraints(to: view, from: self)
        return view
    }
    
    private func setupTitle(_ view:UIView, _ title: Int) {
        let titleStr = String.localized(forKey: "season")
        let value = "\(titleStr): \(title)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 200)
    }
    
    private func setupImage(_ imageUrl: String?) {
        if let imageUrl = imageUrl {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imageView)
            
            Task {
                await UIImage.loadFromString(imageUrl) { [unowned imageView] img in
                    imageView.image = img
                }
            }
            
            imageView.topAnchor.constraint(equalTo:self.topAnchor, constant: 120).isActive = true
            imageView.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        }
    }
    
}
