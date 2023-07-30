//
//  ViewController.swift
//  ExTouch
//
//  Created by 김종권 on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {
    private let aButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("aButton", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let bButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray.withAlphaComponent(0.3)
        button.setTitle("bButton", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let animationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange.withAlphaComponent(0.3)
        button.setTitle("animation", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cntOfA = 0
    private var cntOfB = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(aButton)
        view.addSubview(bButton)
        view.addSubview(animationButton)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            aButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            aButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            bButton.topAnchor.constraint(equalTo: aButton.bottomAnchor, constant: 16),
            bButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: bButton.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            animationButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            animationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
//        aButton.isMultipleTouchEnabled = false
//        aButton.isExclusiveTouch = true
//
//        bButton.isMultipleTouchEnabled = true
//        bButton.isExclusiveTouch = true
        
        aButton.addTarget(self, action: #selector(didTapAButton), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(didTapBButton), for: .touchUpInside)
        animationButton.addTarget(self, action: #selector(tapAnimationButton), for: .touchUpInside)
    }
    
    @objc private func didTapAButton() {
        cntOfA += 1
        label.text = "Tap! 'A', \(cntOfA)"
    }
    
    @objc private func didTapBButton() {
        cntOfB += 1
        label.text = "Tap! 'B', \(cntOfB)"
    }
    
@objc private func tapAnimationButton() {
    print("tapAnimationButton>")
    UIView.animate(
        withDuration: 5,
        delay: 0,
        options: .allowUserInteraction,
        animations: {
            self.label.alpha = 0
            self.animationButton.alpha = 0
        }
    )
}
}
