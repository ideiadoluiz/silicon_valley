//
//  Label.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

extension UILabel {

    internal static func makeLabel(parent: UIView, anchorView: UIView, value: String, top: CGFloat) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(label)
        label.text = value
        label.sizeToFit()
        label.topAnchor.constraint(equalTo:anchorView.topAnchor, constant: top).isActive = true
        label.leftAnchor.constraint(equalTo:anchorView.leftAnchor, constant: 20).isActive = true
    }

}
