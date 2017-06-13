//
//  CapHeightCenteringLabel.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


public class CapHeightCenteringLabel: UILabel {
    public override func drawText(in rect: CGRect) {
        let scale = self.window?.screen.scale ?? UIScreen.main.scale

        let height = self.font.capHeight
        let offset = round((self.bounds.height + height) / 2 * scale) / scale
        let frame = rect.offsetBy(dx: 0, dy: offset)

        self.attributedText!.draw(with: frame, options: [], context: nil)
    }
}
