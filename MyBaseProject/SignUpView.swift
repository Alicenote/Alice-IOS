//
//  SignUpView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x999999)
        setupSlideImage()
        setupBottomBar()
    }
    
    private func setupSlideImage(){
        
    }
    
    private func setupBottomBar(){
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: frame.height - SizeHelper.heightAsHeightScreen(value: 95), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 95)))
            return v
        }()
        addSubview(background)
        
        let logInButton:UIButton = {
            let b = UIButton(frame: CGRect(x: SizeHelper.heightAsHeightScreen(value: 5), y: 0, width: background.frame.width / 2 - 2.5 - SizeHelper.heightAsHeightScreen(value: 5), height: background.frame.height - SizeHelper.heightAsHeightScreen(value: 5)))
            b.setTitle("LOG IN", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
            b.titleLabel!.textAlignment = .center
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            b.addTarget(self, action: #selector(SignUpView.buttonClicked(_:)), for: .touchUpInside)
            b.tag = 0
            return b
        }()
        background.addSubview(logInButton)
        
        let signUpButton:UIButton = {
            let b = UIButton(frame: CGRect(x: background.frame.width / 2 + 2.5, y: 0, width: background.frame.width / 2 - 2.5 - SizeHelper.heightAsHeightScreen(value: 5), height: background.frame.height - SizeHelper.heightAsHeightScreen(value: 5)))
            b.setTitle("SIGN UP", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
            b.titleLabel!.textAlignment = .center
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            b.addTarget(self, action: #selector(SignUpView.buttonClicked(_:)), for: .touchUpInside)
            b.tag = 1
            return b
        }()
        background.addSubview(signUpButton)
    }
    
    func buttonClicked(_ sender: UIButton!){
        switch sender.tag {
        case 0:
            delegate?.selectedLogIn()
            break
        case 1:
            delegate?.selectedSignUp()
            break
        default:
            // to do something
            break
        }
    }
}

protocol SignUpViewDelegate: class {
    func selectedLogIn()
    
    func selectedSignUp()
}

