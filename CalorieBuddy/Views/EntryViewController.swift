//
//  ViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import UIKit

class EntryViewController: UIViewController {

    private let placeholders =  [
        Constants.SignupTextFields(placeHolder: "Name"),
        Constants.SignupTextFields(placeHolder: "Email"),
        Constants.SignupTextFields(placeHolder: "Password"),
        Constants.SignupTextFields(placeHolder: "Confirm Password")
    ]

    private let tabBarImages = [
        Constants.TabBarImages(image: "home", selectedImage: "home_selected"),
        Constants.TabBarImages(image: "edit", selectedImage: "edit_selected"),
        Constants.TabBarImages(image: "user", selectedImage: "user_selected")
    ]

    private let heading: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Calbud"
        label.font = UIFont(name: "Golden Ranger", size: 52)

        return label
    }()

    private let signupStackView: UIStackView = {

       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30

        return stackView
    }()

    private let textFields: [UITextField] = {

        var fields: [UITextField] = []

        for _ in 1...4 {

            let field = UITextField()
            field.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.darkGray.cgColor
            field.layer.cornerRadius = 15

//            Add padding
            field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            fields.append(field)

        }
        return fields
    }()

    private let signupButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Sign up", for: .normal)
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

    private let alreadyuserStackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5

        return stackView
    }()

    private let playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit

        return image
    }()

    override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(heading)
        view.addSubview(signupStackView)
        view.addSubview(signupButton)
        view.addSubview(alreadyuserStackView)
        view.addSubview(playerImage)

        setupLayout()
    }

    fileprivate func setupLayout() {

//        Heading config
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true

//        VStackview config
        signupStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupStackView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20).isActive = true
        signupStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true

        for (index, field) in textFields.enumerated() {

            if index >= placeholders.count - 2 {
                field.isSecureTextEntry = true
            }
            field.heightAnchor.constraint(equalToConstant: 50).isActive = true
            field.placeholder = placeholders[index].placeHolder

            signupStackView.addArrangedSubview(field)
        }

//        Signup button configuration
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.topAnchor.constraint(equalTo: signupStackView.bottomAnchor, constant: 20).isActive = true
        signupButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)

//        Already User stackView config
        let alreadyuserLabel = UILabel()
        alreadyuserLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 17)
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

    @objc private func didTapSignin() {

        let signinVC = SigninViewController()
        let navVC = UINavigationController(rootViewController: signinVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    @objc private func didTapSignup() {
//        var data:[String] = []
//        for field in signupStackView.arrangedSubviews {
//            guard let fieldData = (field as? UITextField)?.text, !data.isEmpty else { return }
//            data.append(fieldData)
//        }
//        if data[2] == data[3]{
//            startSigningUp(username: data[0], email: data[1],password: data[2])
//        }
        showNavController()
    }
    func showNavController() {
        let navBarVC = UITabBarController()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let profileVC = ProfileViewController()

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
        navBarVC.tabBar.backgroundColor = .quaternarySystemFill
        present(navBarVC, animated: true)
    }
    func startSigningUp(username: String, email: String, password: String) {
            print("Api call: ", email, password, username)
        }
}
