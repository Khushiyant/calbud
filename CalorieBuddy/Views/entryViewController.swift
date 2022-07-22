//
//  ViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import UIKit

class entryViewController: UIViewController {

    private let placeholders =  [
        Constants.signupTextFields(placeHolder: "Name"),
        Constants.signupTextFields(placeHolder: "Email"),
        Constants.signupTextFields(placeHolder: "Password"),
        Constants.signupTextFields(placeHolder: "Confirm Password")
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

    private let signupStackView : UIStackView = {
        
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 35
        
        
        return stackView
    }()
    
    private let textField : UITextField = {
        
        let field = UITextField()
//        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont(name: "Arial", size: 18)
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 15
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return field
    }()
    
    private let signupButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Sign up", for: .normal)
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
    
    private let alreadyuserStackView : UIStackView = {
        
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
        view.addSubview(signupStackView)
        view.addSubview(signupButton)
        view.addSubview(alreadyuserStackView)
        view.addSubview(playerImage)
        
        setupLayout()
    }
    
    fileprivate func setupLayout() -> Void{
        
//        Heading config
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
//        VStackview config
        signupStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        signupStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        //      Text Fields config
        
        let nameField = textField
        nameField.placeholder = placeholders[0].placeHolder
        
        let emailField = textField
        emailField.placeholder = placeholders[1].placeHolder
        
        let passwordField = textField
        passwordField.placeholder = placeholders[2].placeHolder
        
        let confirmpasswordField = UITextField()
        confirmpasswordField.placeholder = placeholders[3].placeHolder
        
        signupStackView.addArrangedSubview(nameField)
        signupStackView.addArrangedSubview(emailField)
        signupStackView.addArrangedSubview(passwordField)
        signupStackView.addArrangedSubview(confirmpasswordField)
        
        
//        Signup button configuration
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.topAnchor.constraint(equalTo: signupStackView.bottomAnchor, constant: 20).isActive = true
        signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        
//        Already User stackView config
        let alreadyuserLabel = UILabel()
        alreadyuserLabel.font = UIFont(name: "Arial", size: 17)
        alreadyuserLabel.text = "Already a user?"
        
        let signinButton = UIButton()
        signinButton.setTitle("Sign in", for: .normal)
        signinButton.setTitleColor(UIColor.systemBlue, for: .normal)
        signinButton.addTarget(self, action: #selector(didTapSignin), for: .touchUpInside)
        
        alreadyuserStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alreadyuserStackView.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 10).isActive = true
        alreadyuserStackView.addArrangedSubview(alreadyuserLabel)
        alreadyuserStackView.addArrangedSubview(signinButton)
        
//        Player image config
        playerImage.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        playerImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150).isActive = true
        playerImage.widthAnchor.constraint(equalToConstant: 550).isActive = true
        playerImage.heightAnchor.constraint(equalToConstant: 550).isActive = true

        playerImage.image = UIImage(named: "signupPlayer")
        
    }
    
    @objc private func didTapSignin(){
        
        let signinVC = signinViewController()
        let navVC = UINavigationController(rootViewController: signinVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    @objc private func didTapSignup(){
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

