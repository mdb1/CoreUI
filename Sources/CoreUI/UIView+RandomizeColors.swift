//
//  UIView+RandomizeColors.swift
//  
//
//  Created by Manu Herrera on 22/02/2022.
//

import UIKit

extension UIView {
    /// Changes the background color of the view and all it's subviews for random ones.
    /// Use this method only on debug mode.
    public func randomizeColors() {
        backgroundColor = getRandomColor()
        subviews.forEach({ $0.randomizeColors() })
    }

    private func getRandomColor() -> UIColor {
        UIColor(
           red: CGFloat(arc4random()) / CGFloat(UInt32.max),
           green: CGFloat(arc4random()) / CGFloat(UInt32.max),
           blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
           alpha: 1.0
        )
    }
}
