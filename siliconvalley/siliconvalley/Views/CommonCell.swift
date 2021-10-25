//
//  CommonCell.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

class CommonCell: UITableViewCell {

    private weak var imgView: UIImageView?
    private weak var titleLabel: UILabel?
    private weak var episodeLabel: UILabel?
    private weak var favoriteButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         self.setup()
    }
    
    func setup() {
        let mainView = setupMainView()
        self.imgView = self.setupImageView(mainView)
        self.titleLabel = self.makeLabel(parent: mainView,
                                         value: "",
                                         top: 5)
        self.episodeLabel = self.makeLabel(parent: mainView,
                                           value: "",
                                           top: 35)
        self.episodeLabel?.font = self.episodeLabel?.font.withSize(12)
        self.favoriteButton = self.makeButton(parent: mainView, top: 10)
    }
    
    func fill(title: String, imgUrl: String, episode: Int, season: Int, favorite: Bool,
              target: Any?, action: Selector) {
        self.titleLabel?.text = "\(String.localized(forKey: "title")): \(title)"
        let seasonStr = "\(String.localized(forKey: "season")): \(season)"
        let episodeStr = "\(String.localized(forKey: "episode")): \(episode)"
        self.episodeLabel?.text = "\(seasonStr) \(episodeStr)"
        let icon = favorite ? "star.fill" : "star"
        self.favoriteButton?.setImage(UIImage(systemName: icon), for: .normal)
        self.favoriteButton?.addTarget(target, action: action, for: .touchUpInside)
        self.loadImage(imgUrl)
    }
    
    private func loadImage(_ imgUrl: String) {
        Task {
            await UIImage.loadFromString(imgUrl) { [unowned self] img in
                self.imgView?.image = img
            }
        }
    }
    
    private func setupMainView() -> UIView {
        let view = UIView(frame: self.frame)
        view.backgroundColor = .white.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        UIView.addFitContraints(to: view, from: self)
        return view
    }
    
    private func setupImageView(_ parentView: UIView) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo:self.topAnchor, constant: 5).isActive = true
        imageView.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }
    
    private func makeLabel(parent: UIView, value: String, top: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(label)
        label.text = value
        label.sizeToFit()
        label.topAnchor.constraint(equalTo:self.topAnchor, constant: top).isActive = true
        label.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 70).isActive = true
        return label
    }
    
    private func makeButton(parent: UIView, top: CGFloat) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(btn)
        btn.setImage(UIImage(systemName: "star"), for: .normal)
        btn.topAnchor.constraint(equalTo:self.topAnchor, constant: top).isActive = true
        btn.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -20).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return btn
    }
}
