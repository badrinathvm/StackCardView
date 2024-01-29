//
//  ViewController.swift
//  StackCardView
//
//  Created by Badarinath Venkatnarayansetty on 01/29/2024.
//  Copyright (c) 2024 Badarinath Venkatnarayansetty. All rights reserved.
//

import UIKit
import SwiftUI
import StackCardView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stackCardView = UIHostingController(rootView: StackCardDemoView())
        stackCardView.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackCardView.view)
        
        //set constraints
        NSLayoutConstraint.activate([
            stackCardView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            stackCardView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            stackCardView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackCardView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


