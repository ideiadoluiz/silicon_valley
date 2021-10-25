//
//  Color.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

/*
 * Note: You will see that this class always returns a color and I would
 * have two options:
 *   - throw an exception
 *   - return a default color for each of them
 * I chose the second so the app wouldn't crash if we changed the color's name
 * in the Colors.xcassets folder.
 */
internal class Color : UIColor {
    
    internal static var navBarBlue: UIColor {
        return UIColor(named: "navigation_bar_blue") ?? UIColor.systemBackground;
    }

}
