//
//  HeaderView.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class HeaderView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, title: String, imageUrl: String?,
         summary: String, countSeasons: Int, countEpisodes: Int) {
        super.init(frame: frame)
        setupImage(imageUrl)
    }
    
    func setupImage(_ imageUrl: String?) {
        if let imageUrl = imageUrl {
            let imageView = UIImageView(frame: self.frame)
            imageView.image = UIImage.loadFromString(imageUrl)
            self.addSubview(imageView)
        }
    }
    
    func setupUI() {
        
    }
    
    
    
}
