//
//  AppleImitatingLabel.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


public class AppleImitatingLabel: UILabel {
    public override func drawText(in rect: CGRect) {
        let offset = self.predictedBaselineOffset
        let frame = rect.offsetBy(dx: 0, dy: offset)

        self.attributedText!.draw(with: frame, options: [], context: nil)
    }
}
