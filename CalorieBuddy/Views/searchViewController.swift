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
        
        let today = UILabel()
        today.text = "TODAY"
        today.font = UIFont(name: "Arial Bold", size: 25)
        
        
        let todayDate = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        todayDate.text = "\(dateFormatter.string(from: Date()))"
        todayDate.font = UIFont(name: "Arial", size: 18)
        
        let view = UIStackView(arrangedSubviews: [today, todayDate])
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
//    private let postCard : postCard = {
//        let card = postCard()
//
//        return card
//    }()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        view.addSubview(dateView)
        view.addSubview(searchBar)
        
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
        
//        Search Bar config
        
//        Postcard config
//        postCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        postCard.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 10).isActive = true
        
    }
}
