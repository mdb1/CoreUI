//
//  UIView+RoundCorners.swift
//  
//
//  Created by Manu Herrera on 17/02/2022.
//

import UIKit

extension UIView {
    public var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }

    public func round(corners: [SingularCorner], radius: CGFloat) {
        cornerRadius = radius
        let layerCorners = corners.compactMap { $0.toCornerMask() }
        var maskedCorners: CACornerMask = []
        layerCorners.forEach { maskedCorners.insert($0) }
        layer.maskedCorners = maskedCorners
    }
}

public enum SingularCorner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    func toCornerMask() -> CACornerMask {
        switch self {
        case .topLeft:
            return .layerMinXMinYCorner
        case .topRight:
            return .layerMaxXMinYCorner
        case .bottomLeft:
            return .layerMinXMaxYCorner
        case .bottomRight:
            return .layerMaxXMaxYCorner
        }
    }
}
