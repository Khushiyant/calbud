//
//  aboutViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 27/07/22.
//

import Foundation
import UIKit

class aboutViewController : UIViewController {
    
    private let header : appHeader = {
        let head = appHeader()
        head.translatesAutoresizingMaskIntoConstraints = false
        
        return head
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        
        setupLayout()
        
    }
    fileprivate func setupLayout(){
//        Header Configuration
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive  = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        
    }
}
