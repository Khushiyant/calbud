//
//  searchViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import Foundation
import UIKit

class searchViewController : UIViewController {
    
    private let header : appHeader = {
       let head = appHeader()
        head.translatesAutoresizingMaskIntoConstraints = false

        return head
    }()
    
    private let dateView : UIStackView = {
        
//        Taday Title
        let today = UILabel()
        today.text = "TODAY"
        today.font = UIFont(name: "Arial Bold", size: 25)
        
        
//        Today's Date
        let todayDate = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        todayDate.text = "\(dateFormatter.string(from: Date()))"
        todayDate.font = UIFont(name: "Arial", size: 18)
        
//        VStackView
        let view = UIStackView(arrangedSubviews: [today, todayDate])
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        view.addSubview(dateView)
        
        
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        
//        Header Configuration
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive  = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
//        dateView config
        dateView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
}
