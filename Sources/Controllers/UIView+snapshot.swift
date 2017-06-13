//
//  UIView+snapshot.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


extension UIView {
    var snapshot: UIImage {
        let bounds = CGRect(origin: .zero, size: self.bounds.size)
        let scale = self.contentScaleFactor

        guard !bounds.isEmpty else {
            return UIImage()
        }

        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)

        if let color = self.backgroundColor {
            let context = UIGraphicsGetCurrentContext()!

            context.setFillColor(color.cgColor)
            context.fill(bounds)
        }

        self.draw(bounds)

        let image = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()

        return image
    }
}
