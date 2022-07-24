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
    
    private let textFields : [UITextField] = {
        
        var fields:[UITextField] = []
                      
        for _ in 1...2 {
            
            let field = UITextField()
            
            field.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
            field.layer.borderWidth = 1
            field.layer.cornerRadius = 15
            
//            Add padding
            field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            fields.append(field)
            
        }
        return fields
    }()
    
    private let signinButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        
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
    
    private let orBar : UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Or"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        
        return label
    }()
    
    private let googleIcon : UIImageView = {
       
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "google")
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        
        return view
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
        view.addSubview(orBar)
        view.addSubview(googleIcon)
        view.addSubview(playerImage)
        
        setupLayout()
    }
    
    fileprivate func setupLayout(){
//        Heading config
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
//        VStackview config
        signinStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinStackView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20).isActive = true
        signinStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        for (index, field) in textFields.enumerated() {
            
            if index >= placeholders.count - 1 {
                field.isSecureTextEntry = true
            }
            field.heightAnchor.constraint(equalToConstant: 50).isActive = true
            field.placeholder = placeholders[index].placeHolder
            signinStackView.addArrangedSubview(field)
        }
        
//        Signin button configuration
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.topAnchor.constraint(equalTo: signinStackView.bottomAnchor, constant: 20).isActive = true
        signinButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        signinButton.addTarget(self, action: #selector(didTapSignin), for: .touchUpInside)
        
//        New User stackView config
        let newuserLabel = UILabel()
        newuserLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 17)
        newuserLabel.text = "New user?"
        
        let signupButton = UIButton()
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.setTitleColor(UIColor.systemBlue, for: .normal)
        signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        
        newuserStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newuserStackView.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 10).isActive = true
        newuserStackView.addArrangedSubview(newuserLabel)
        newuserStackView.addArrangedSubview(signupButton)
        
        
//        Or bar
        orBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        orBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        orBar.topAnchor.constraint(equalTo: newuserStackView.bottomAnchor, constant: 10).isActive = true
        orBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        Google icon config
        googleIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleIcon.topAnchor.constraint(equalTo: orBar.bottomAnchor, constant: 20).isActive = true
        
        let singleTab = UITapGestureRecognizer(target: self, action: #selector(googleAuth))
        googleIcon.addGestureRecognizer(singleTab)
        
//        Player image config
        playerImage.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        playerImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150).isActive = true
        playerImage.widthAnchor.constraint(equalToConstant: 550).isActive = true
        playerImage.heightAnchor.constraint(equalToConstant: 550).isActive = true

        playerImage.image = UIImage(named: "signinPlayer")
    }
    
//    Tap Functions
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
        navBarVC.tabBar.backgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        present(navBarVC, animated: true)
        
    }
    @objc private func googleAuth(){
        print("GoogleAuth")
    }
}

