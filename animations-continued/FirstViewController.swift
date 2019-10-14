//
//  ViewController.swift
//  animations-continued
//
//  Created by David Rifkin on 10/14/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var myView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var flipButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Flip", for: .normal)
        button.addTarget(self, action: #selector(flipButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(myView)
        self.view.addSubview(flipButton)
        // Do any additional setup after loading the view.
        setUpMyViewConstraints()
        setUpFlipButtonConstraints()
    }
    
    @objc private func flipButtonPressed() {
        UIView.transition(with: myView, duration: 1.2, options: [.autoreverse, .transitionCurlUp,.curveEaseIn], animations: {
            if self.myView.backgroundColor == .blue {
                self.myView.backgroundColor = .red
            } else {
                self.myView.backgroundColor = .blue
            }
        }, completion: nil)
    }
    
    private func setUpFlipButtonConstraints(){
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flipButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            flipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            flipButton.widthAnchor.constraint(equalToConstant: 75),
            flipButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setUpMyViewConstraints(){
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myView.widthAnchor.constraint(equalToConstant: 150),
            myView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

