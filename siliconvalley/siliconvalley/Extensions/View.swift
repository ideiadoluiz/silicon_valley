//
//  View.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

extension UIView {
    
    internal static func addFitContraints(to: UIView, from: UIView) {
        to.topAnchor.constraint(equalTo:from.topAnchor).isActive = true
        to.leftAnchor.constraint(equalTo:from.leftAnchor).isActive = true
        to.rightAnchor.constraint(equalTo:from.rightAnchor).isActive = true
        to.bottomAnchor.constraint(equalTo:from.bottomAnchor).isActive = true
    }
}
