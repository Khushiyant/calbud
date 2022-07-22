//
//  signinViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import Foundation
import UIKit

class signinViewController : UIViewController {
    
    private let placeholders =  [
        Constants.signupTextFields(placeHolder: "Name"),
        Constants.signupTextFields(placeHolder: "Password")
    ]
    
    private let tabBarImages = [
        Constants.tabBarImages(image: "home", selectedImage: "home_selected"),
        Constants.tabBarImages(image: "edit", selectedImage: "edit_selected"),
        Constants.tabBarImages(image: "user", selectedImage: "user_selected")
    ]
    
    private let heading : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Calbud"
        label.font = UIFont(name: "Golden Ranger", size: 52)
        
        return label
    }()
    
    private let signinStackView : UIStackView = {
        
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 35
        
        return stackView
    }()
    
    private let textField : UITextField = {
        
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont(name: "Arial", size: 18)
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return field
    }()
    
    private let signinButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
        
        button.backgroundColor = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0
        
        return button
    }()
    
    private let newuserStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let playerImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(heading)
        view.addSubview(signinStackView)
        view.addSubview(signinButton)
        view.addSubview(newuserStackView)
        view.addSubview(playerImage)
        
        setupLayout()
    }
    
    fileprivate func setupLayout(){
//        Heading config
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
//        VStackview config
        signinStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinStackView.centerYAnchor.constraint(equalTo: heading.bottomAnchor, constant: 70).isActive = true
        signinStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        
        let nameField = textField
        nameField.placeholder = placeholders[0].placeHolder
        
        let passwordField = textField
        passwordField.placeholder = placeholders[1].placeHolder
        
        signinStackView.addArrangedSubview(nameField)
        signinStackView.addArrangedSubview(passwordField)
        
//        Signin button configuration
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.topAnchor.constraint(equalTo: signinStackView.bottomAnchor, constant: 20).isActive = true
        signinButton.addTarget(self, action: #selector(didTapSignin), for: .touchUpInside)
        
//        New User stackView config
        let newuserLabel = UILabel()
        newuserLabel.font = UIFont(name: "Arial", size: 17)
        newuserLabel.text = "New user?"
        
        let signupButton = UIButton()
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.setTitleColor(UIColor.systemBlue, for: .normal)
        signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        
        newuserStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newuserStackView.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 10).isActive = true
        newuserStackView.addArrangedSubview(newuserLabel)
        newuserStackView.addArrangedSubview(signupButton)
        
//        Player image config
        playerImage.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        playerImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150).isActive = true
        playerImage.widthAnchor.constraint(equalToConstant: 550).isActive = true
        playerImage.heightAnchor.constraint(equalToConstant: 550).isActive = true

        playerImage.image = UIImage(named: "signinPlayer")
    }
    
    @objc private func didTapSignup(){
        let signupVC = entryViewController()
        let navVC = UINavigationController(rootViewController: signupVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    @objc private func didTapSignin(){
        
        let navBarVC = UITabBarController()
        
        let homeVC = homeViewController()
        let searchVC = searchViewController()
        let profileVC = profileViewController()
        
        homeVC.title = "Home"
        searchVC.title = "Track"
        profileVC.title = "Profile"
        
        navBarVC.setViewControllers([homeVC, searchVC, profileVC], animated: false)
        
        guard let items = navBarVC.tabBar.items else { return }
        
        for index in 0..<items.count {
            items[index].image = UIImage(named: tabBarImages[index].image)
            items[index].selectedImage = UIImage(named: tabBarImages[index].selectedImage)
        }
        navBarVC.modalPresentationStyle = .fullScreen
        present(navBarVC, animated: true)
        
    }
}

