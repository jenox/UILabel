//
//  DemoViewController.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


public class DemoViewController: UIViewController {

    // MARK: - Customization

    private let label1: UILabel = AppleImitatingLabel()
    private let label2: UILabel = UILabel()
    private let label3: UILabel = AutoLayoutLabel()
    private let slider: UISlider = UISlider()

    private static func font(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
//        return UIFont(name: "Zapfino", size: size)!
    }



    // MARK: - Initialization

    public init() {
        let text = "Lorem Ipsum" // "Quốc ngữÂ â"
        let alignment = NSTextAlignment.left
        let wrapping = NSLineBreakMode.byClipping

        self.label1.text = text
        self.label1.textAlignment = alignment
        self.label1.lineBreakMode = wrapping
        self.label1.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.label1.clipsToBounds = true

        self.label2.text = text
        self.label2.textAlignment = alignment
        self.label2.lineBreakMode = wrapping
        self.label2.clipsToBounds = true

        self.label3.text = text
        self.label3.textAlignment = alignment
        self.label3.lineBreakMode = wrapping
        self.label3.clipsToBounds = true

        self.slider.minimumValue = 12.0
        self.slider.maximumValue = 96.0
        self.slider.value = 36.0

        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }



    // MARK: - Font Management

    private var font: UIFont = DemoViewController.font(ofSize: 24) {
        didSet { self.fontDidChange() }
    }

    private func fontDidChange() {
        self.label1.font = font
        self.label2.font = font
        self.label3.font = font

        self.view.setNeedsLayout()
    }

    @objc private func action() {
        self.font = DemoViewController.font(ofSize: CGFloat(self.slider.value))
    }



    // MARK: - View Management

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.label1.backgroundColor = UIColor.orange
        self.label2.backgroundColor = UIColor.green
        self.label3.backgroundColor = UIColor.cyan

        self.view.addSubview(self.label1)
        self.view.addSubview(self.label2)
        self.view.addSubview(self.label3)
        self.view.addSubview(self.slider)

        self.slider.addTarget(self, action: #selector(self.action), for: .valueChanged)
        self.slider.sendActions(for: .valueChanged)
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var working = self.view.bounds
        working = working.divided(atDistance: 20, from: .minYEdge).remainder

        let top, frame1, frame2, frame3, slider: CGRect

        (top, working) = working.divided(atDistance: 80, from: .minYEdge)
        (frame1, frame2) = top.divided(atDistance: round(working.width / 2), from: .minXEdge)

        working = working.divided(atDistance: 40, from: .minXEdge).remainder
        working = working.divided(atDistance: 40, from: .maxXEdge).remainder

        working = working.divided(atDistance: 10, from: .minYEdge).remainder
        (slider, working) = working.divided(atDistance: self.slider.sizeThatFits(.zero).height, from: .minYEdge)
        working = working.divided(atDistance: 10, from: .minYEdge).remainder
        (frame3, working) = working.divided(atDistance: self.label3.sizeThatFits(.zero).height, from: .minYEdge)

        self.label1.frame = frame1
        self.label2.frame = frame2
        self.label3.frame = frame3
        self.slider.frame = slider
    }
}
