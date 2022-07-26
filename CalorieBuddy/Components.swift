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
        headerLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
    }
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
class sectionHeader : UIView {
        
    private let stackView : UIStackView = {
       
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let iconImage : UIImageView = {
        
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private let header : UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        return label
    }()

    override init(frame : CGRect){
        super.init(frame: frame)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(header)

    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    func config(viewModel : Constants.headerData){
        
        header.text = viewModel.header
        iconImage.image = UIImage(named: viewModel.icon)
    }

}
