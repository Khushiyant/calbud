//
//  appHeader.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 22/07/22.
//

import Foundation
import UIKit

class appHeader : UIView {
    
    let headerLabel : UILabel = {
        
       let label = UILabel()
        label.text = "Calbud"
        label.font = UIFont(name: "Golden Ranger", size: 55)
        
        return label
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        self.layer.borderWidth = 1
        
        self.addSubview(headerLabel)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func setupLayout(){
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true    }
}

class postCard : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout(){
        
    }
}
