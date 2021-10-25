//
//  DetailsView.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import Foundation

import UIKit

class DetailsView: UIView {
    
    private weak var btn: UIButton?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, episode: Episode, favorite: Bool, target: Any?, action: Selector) {
        super.init(frame: frame)
        let mainView = setupMainView()
        setupImage(episode.image.medium!)
        setupButton(parent: mainView, top: 300, favorite: favorite,
                   hash: episode.name!.hashValue, target: target, action: action)
        setupTitle(mainView, episode.name!)
        setupNumbersView(mainView, episode.season!, episode.number!)
        setupAirDate(mainView, episode.airDate!)
        setupRuntime(mainView, episode.runtime!)
        setupSummary(mainView, episode.summary!, 470)
    }
    
    private func setupMainView() -> UIView {
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        UIView.addFitContraints(to: view, from: self)
        return view
    }
    
    private func setupTitle(_ view: UIView, _ title: String) {
        let titleStr = String.localized(forKey: "title")
        let value = "\(titleStr): \(title)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 350)
    }
    
    private func setupNumbersView(_ view: UIView, _ season: Int, _ episode: Int) {
        let seasonStr = "\(String.localized(forKey: "season")): \(season)"
        let episodeStr = "\(String.localized(forKey: "episode")): \(episode)"
        let value = "\(seasonStr) \(episodeStr)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 380)
    }
    
    private func setupAirDate(_ view: UIView, _ airdate: String) {
        let titleStr = String.localized(forKey: "airdate")
        let value = "\(titleStr): \(airdate)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 410)
    }
    
    private func setupRuntime(_ view: UIView, _ runtime: Int) {
        let titleStr = String.localized(forKey: "runtime")
        let value = "\(titleStr): \(runtime)"
        UILabel.makeLabel(parent: view, anchorView: self, value: value, top: 440)
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
    
    internal func updateButton(favorite: Bool) -> Void {
        let icon = favorite ? "star.fill" : "star"
        self.btn?.setImage(UIImage(systemName: icon), for: .normal)
    }
    
    private func setupButton(parent: UIView, top: CGFloat, favorite: Bool, hash: Int, target: Any?, action: Selector) {
        let btn = UIButton()
        self.btn = btn
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        parent.addSubview(btn)
        self.updateButton(favorite: favorite)
        btn.topAnchor.constraint(equalTo:parent.topAnchor, constant: top).isActive = true
        btn.centerXAnchor.constraint(equalTo:parent.centerXAnchor).isActive = true
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.tag = hash
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
}
