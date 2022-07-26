//
//  profileViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import Foundation
import UIKit

class profileViewController : UIViewController {
    
    private let profileSections = [Constants.profileSection(section: "CURRENT STATUS"),
                                   Constants.profileSection(section: "ABOUT")]
    
    private let currentStatusCells = [Constants.currentStatusCell(cell: "Current Weight", viewController: aboutViewController()),
                                      Constants.currentStatusCell(cell: "Week Avg", viewController: aboutViewController()),
                                      Constants.currentStatusCell(cell: "Trend", viewController: aboutViewController())]
    
    private let aboutCells = [Constants.aboutCell(cell: "About Us", viewController: aboutViewController()),
                              Constants.aboutCell(cell: "Working", viewController: aboutViewController()),
                              Constants.aboutCell(cell: "More", viewController: aboutViewController())]
    
    private let avatarImage : Constants.profileImage = Constants.profileImage(image: "curly-hair")
    
    private let header : appHeader = {
        let head = appHeader()
        head.translatesAutoresizingMaskIntoConstraints = false
        
        return head
    }()
    
    private let profileImage : UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(red: 231.0/255.0, green: 207.0/255.0, blue: 138.0/255.0, alpha: 1.0)
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 1
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 0.2
        image.layer.shadowOffset = .init(width: 5, height: 5)
        image.layer.shadowRadius = 0
        
        return image
    }()
    
    private let userLabel : UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: "Zapfino", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let joinedDate : UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: "Chalkduster", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        return view
    }()
    let tableContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        view.addSubview(profileImage)
        view.addSubview(userLabel)
        view.addSubview(joinedDate)
        view.addSubview(tableContainer)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        Table view config
        tableView.frame = tableContainer.bounds
    

    }
    
    
    
    fileprivate func setupLayout(){

//        Header Configuration
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive  = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
//        Profile image config
        profileImage.image = UIImage(named: avatarImage.image)
        profileImage.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        profileImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.35).isActive = true
        
        profileImage.addSubview(userLabel)
        
        //  User Label Config
        userLabel.text = "Khushiyant"
        userLabel.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor).isActive = true
        userLabel.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true

//        Joined date config
        let date = "July 2022"
        joinedDate.text = "Joined on \(date)"
        joinedDate.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5).isActive = true
        joinedDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive  = true
        
//        Table container config
        
        tableContainer.topAnchor.constraint(equalTo: joinedDate.bottomAnchor, constant: 20).isActive = true
        tableContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        tableContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableContainer.addSubview(tableView)
    }
    
}
extension profileViewController : UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentStatusCells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return profileSections[section].section
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let navVC = UINavigationController(rootViewController: currentStatusCells[indexPath.row].viewController)
            present(navVC, animated: true)
        }
        else if indexPath.section == 1 {
            let navVC = UINavigationController(rootViewController: aboutCells[indexPath.row].viewController)
            present(navVC, animated: true)
        }

    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionTitle = sectionHeader()
//
//        if section == 0 {
//            let currentViewModel = Constants.headerData(icon: "edit", header: "CURRENT STATUS")
//            sectionTitle.config(viewModel: currentViewModel)
//        }
//        else if section == 1 {
//            let aboutViewModel = Constants.headerData(icon: "edit", header: "ABOUT")
//            sectionTitle.config(viewModel: aboutViewModel)
//        }
//
//        return sectionTitle
//    }
    
}
extension profileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        
        cell.layer.borderWidth = 1
        if indexPath.section == 0 {
            cell.textLabel?.text = currentStatusCells[indexPath.row].cell
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = aboutCells[indexPath.row].cell
        }
        return cell
    }
}
