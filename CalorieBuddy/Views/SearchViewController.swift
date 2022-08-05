//
//  searchViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {

    private let header: AppHeader = {
       let head = AppHeader()
        head.translatesAutoresizingMaskIntoConstraints = false

        return head
    }()

    private let dateView: UIStackView = {

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

    private let searchContainer: UIView = {

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(header)
        view.addSubview(dateView)
        view.addSubview(searchContainer)

        setupLayout()
    }

    fileprivate func setupLayout() {

//        Header Configuration
        header.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        header.topAnchor.constraint(equalTo: view.topAnchor, constant: -1).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.01).isActive  = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true

//        dateView config
        dateView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

    }
}
