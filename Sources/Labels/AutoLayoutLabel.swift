//
//  AutoLayoutLabel.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


public class AutoLayoutLabel: UILabel {
    public override init(frame: CGRect) {
        self.marker = UIView()
        self.marker.isHidden = true

        super.init(frame: frame)

        self.addSubview(self.marker)

        let pixel = 1 / UIScreen.main.scale

        // Only works when sized to fit.
        self.marker.translatesAutoresizingMaskIntoConstraints = false
        self.marker.topAnchor.constraint(equalTo: self.firstBaselineAnchor, constant: pixel).isActive = true
        self.marker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.marker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.marker.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    private let marker: UIView

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect)

        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.red.cgColor)
        context.fill(self.marker.frame)
    }
}
