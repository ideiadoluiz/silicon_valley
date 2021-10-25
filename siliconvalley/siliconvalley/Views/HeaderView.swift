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
        let mainView = setupMainView()
        setupTitle(mainView, title)
        setupNumbersView(mainView, countSeasons, countEpisodes)
        setupSummary(mainView, summary, 110)
    }
    
    private func setupMainView() -> UIView {
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        UIView.addFitContraints(to: view, from: self)
        return view
    }
    
    private func setupImage(_ imageUrl: String?) {
        if let imageUrl = imageUrl {
            let imageView = UIImageView(frame: self.frame)
            imageView.image = UIImage.loadFromString(imageUrl)
            self.addSubview(imageView)
        }
    }
    
    private func setupTitle(_ view:UIView, _ title: String) {
        let titleStr = String.localized(forKey: "title")
        let value = "\(titleStr): \(title)"
        makeLabel(parent: view, value: value, top: 20)
    }
    
    private func setupNumbersView(_ view: UIView, _ seasons: Int, _ episodes: Int) {
        let countSeasons = String.localized(forKey: "n_seasons")
        let value1 = "\(countSeasons): \(seasons)"
        makeLabel(parent: view, value: value1, top: 50)
        
        let countEpisodes = String.localized(forKey: "n_episodes")
        let value2 = "\(countEpisodes): \(episodes)"
        makeLabel(parent: view, value: value2, top: 80)
    }
    
    private func setupSummary(_ parent: UIView, _ summary: String, _ top: CGFloat) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(label)
        label.text = summary.cleanParagraph
        label.sizeToFit()
        label.numberOfLines = 0
        label.topAnchor.constraint(equalTo:self.topAnchor, constant: top).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(equalToConstant:self.frame.size.width - 40).isActive = true
    }
    
    private func makeLabel(parent: UIView, value: String, top: CGFloat) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(label)
        label.text = value
        label.sizeToFit()
        label.topAnchor.constraint(equalTo:self.topAnchor, constant: top).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 20).isActive = true
    }
}