//
//  aboutViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 27/07/22.
//

import Foundation
import UIKit

class aboutViewController : UIViewController {

    private let filePath : String = "aboutUs"
    private let aboutUs : UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About Us"
        
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        return label
    }()
    
    private let aboutContent : UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(aboutUs)
        view.addSubview(aboutContent)
        setupLayout()
        
    }
    fileprivate func setupLayout(){
        
//        About me label
        aboutUs.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        aboutUs.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//      About us content
        aboutContent.topAnchor.constraint(equalTo: aboutUs.bottomAnchor, constant: 20).isActive = true
        aboutContent.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        aboutContent.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        aboutContent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        aboutContent.text = "Hello Everyone"
                 
        

        
    }
}
