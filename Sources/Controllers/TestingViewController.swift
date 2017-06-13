//
//  TestingViewController.swift
//  UILabel
//
//  Created by Christian Schnorr on 12.06.17.
//  Copyright © 2017 Christian Schnorr. All rights reserved.
//

import UIKit


public class TestingViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)

        self.addChildViewController(self.contentViewController)
        self.contentViewController.didMove(toParentViewController: self)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }



    // MARK: - Trait Collection

    private let contentViewController: UIViewController = UIViewController()

    public override func viewDidLoad() {
        self.view.addSubview(self.contentViewController.view)

        // This seems to have no effect whatsoever.
        let traits = UITraitCollection(displayScale: 10)

        self.setOverrideTraitCollection(traits, forChildViewController: self.contentViewController)
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.contentViewController.view.frame = self.view.bounds
    }



    // MARK: - Tests

    public override func viewDidAppear(_ animated: Bool) {
        let scale = UIScreen.main.scale
        let height = 40 as CGFloat

        print("BEGIN TESTING @ \(scale)x")

        for i in stride(from: 12, through: 20, by: 1) {
            let size = CGFloat(i)

            self.test(with: size, in: height, at: scale)
            self.test(with: size, in: height + 0.1, at: scale)
            self.test(with: size, in: height - 0.1, at: scale)
        }

//        for i in stride(from: 120, through: 720, by: 1) {
//            let size = CGFloat(i) / 10
//
//            self.test(with: size, in: height, at: scale)
//            self.test(with: size, in: height + 0.0001, at: scale)
//            self.test(with: size, in: height - 0.0001, at: scale)
//        }

        print("END TESTING")
        print()
        print("$ open \(self.documentsDirectory.path)")
    }

    @discardableResult
    private func test(with size: CGFloat, in height: CGFloat, at scale: CGFloat) -> Bool {
        let text = "Lorem Ipsum"
        let font = UIFont.systemFont(ofSize: size)
        let frame = CGRect(x: 0, y: 0, width: 500, height: height)

        let label1 = AppleImitatingLabel()
        label1.text = text
        label1.font = font
        label1.frame = frame
        label1.backgroundColor = .white
        label1.textColor = .black

        let label2 = UILabel()
        label2.text = text
        label2.font = font
        label2.frame = frame
        label2.backgroundColor = .white
        label2.textColor = .black

        self.contentViewController.view.addSubview(label1)
        self.contentViewController.view.addSubview(label2)

        label1.contentScaleFactor = scale
        label2.contentScaleFactor = scale

        let image1 = label1.snapshot
        let data1 = UIImagePNGRepresentation(image1)!

        let image2 = label2.snapshot
        let data2 = UIImagePNGRepresentation(image2)!

        if data1 == data2 {
            return true
        }
        else {
            print("Incorrect predicted baseline for \(font.pointSize)pt \(font.fontName) in \(frame.height)pt at \(scale)x")

            self.save(image1, for: font, in: frame, at: scale, suffix: "predicted")
            self.save(image2, for: font, in: frame, at: scale, suffix: "actual")

            return false
        }
    }

    private func save(_ image: UIImage, for font: UIFont, in rect: CGRect, at scale: CGFloat, suffix: String? = nil) {
        if let suffix = suffix {
            self.save(image, as: "\(font.pointSize)pt-\(font.fontName)-in-\(rect.height)pt-at-\(scale)x-\(suffix)")
        }
        else {
            self.save(image, as: "\(font.pointSize)pt-\(font.fontName)-in-\(rect.height)pt-at-\(scale)x")
        }
    }

    private func save(_ image: UIImage, as name: String) {
        let data = UIImagePNGRepresentation(image)!
        let url = self.documentsDirectory.appendingPathComponent("\(name)@2x.png")

        try! data.write(to: url)
    }

    private var documentsDirectory: URL {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let url = URL(fileURLWithPath: paths.first!)

        return url
    }
}
