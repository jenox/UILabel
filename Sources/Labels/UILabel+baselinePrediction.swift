//
//  UILabel+baselinePrediction.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


extension UILabel {

    // Incorrect only when the label's height is not rounded to pixels with
    // reasonable accuracy, e.g. for:
    //  - a 13.0pt system font in a 40.1pt container on a 2x screen
    //  - a 16.0pt system font in a 40.1pt container on a 3x screen
    public var predictedBaselineOffset: CGFloat {
        let scale = self.window?.screen.scale ?? UIScreen.main.scale

        let availablePixels = round(self.bounds.height * scale)
        let preferredPixels = ceil(self.font.lineHeight * scale)
        let ascenderPixels = round(self.font.ascender * scale)
        let offsetPixels = ceil((availablePixels - preferredPixels) / 2)

        return (ascenderPixels + offsetPixels) / scale
    }

    // Incorrect for various scenarios @3x even if the label's height is rounded
    // to pixels, e.g. for:
    //  - a 13.0pt system font in a 121px container
    public var incorrectPredictedBaselineOffset: CGFloat {
        let scale = self.window?.screen.scale ?? UIScreen.main.scale

        let available = round(self.bounds.height * scale) / scale
        let preferred = ceil(self.font.lineHeight * scale) / scale
        let ascender = round(self.font.ascender * scale) / scale
        let offset = ceil((available - preferred) / 2 * scale) / scale

        return ascender + offset
    }
}
