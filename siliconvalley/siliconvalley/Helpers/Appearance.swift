//
//  Appearance.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

internal struct Appearance {

    @available(*, unavailable) private init() {}

    internal static func setup() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color.navBarBlue
        appearance.titleTextAttributes = [
            .foregroundColor : Color.white,
            .font : UIFont(name: "HelveticaNeue-Bold", size: 20)!
        ]
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.standardAppearance = appearance;
        navigationBarAppearace.scrollEdgeAppearance = navigationBarAppearace.standardAppearance;
        navigationBarAppearace.tintColor = .white
    }
}
