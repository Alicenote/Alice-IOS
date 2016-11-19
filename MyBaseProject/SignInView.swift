//
//  SignInView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class SignInView: UIView, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    weak var delegate:SignInViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var inputTextEmail:MyUITextField?
    var inputTextPassword:MyUITextField?
    var swichRememberMe:UISwitch?
    func setupViews(){
        backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc)
        let background: UIScrollView = {
            let s = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            return s
        }()
        addSubview(background)
        
        let logo:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 320)))
            return v
        }()
        background.addSubview(logo)
        
        inputTextEmail = {
            let t = MyUITextField(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 295) + 10, width: frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 90) - 10))
            t.backgroundColor = UIColor.clear
            t.attributedPlaceholder = NSAttributedString(string:"Email",attributes:[NSForegroundColorAttributeName: UIColor.white])
            return t
        }()
        background.addSubview(inputTextEmail!)
        
        let lineBlackEmail:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 385), width: frame.width - 20, height: 1))
            v.backgroundColor = UIColor.black
            return v
        }()
        background.addSubview(lineBlackEmail)
        
        inputTextPassword = {
            let t = MyUITextField(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 385) + 10, width: frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 90) - 10))
            t.backgroundColor = UIColor.clear
            t.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor.white])
            return t
        }()
        background.addSubview(inputTextPassword!)
        
        let lineBlackPassword:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 475), width: frame.width - 20, height: 1))
            v.backgroundColor = UIColor.black
            return v
        }()
        background.addSubview(lineBlackPassword)
        
        let buttonLogIn:UIButton = {
            let b = UIButton(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 620), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 71)))
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x999999)
            b.setTitle("LOG IN", for: UIControlState.normal)
            b.titleLabel!.textAlignment = .center
            b.titleLabel!.textColor = UIColor.white
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            return b
        }()
        background.addSubview(buttonLogIn)
        
        let rememberMe:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 725), width: frame.width - 20 - SizeHelper.widthAsWidthScreen(value: 140), height: SizeHelper.heightAsHeightScreen(value: 25)))
            l.backgroundColor = UIColor.clear
            l.text = "Remember Me"
            l.textAlignment = .right
            l.textColor = UIColor.white
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 22.5))
            return l
        }()
        background.addSubview(rememberMe)
        
        swichRememberMe = {
            let w = UISwitch(frame: CGRect(x: frame.width - 20 - SizeHelper.widthAsWidthScreen(value: 140) + 20, y: SizeHelper.heightAsHeightScreen(value: 712), width: SizeHelper.widthAsWidthScreen(value: 70), height: SizeHelper.heightAsHeightScreen(value: 30)))
            w.isOn = true
            w.transform = CGAffineTransform(scaleX: 0.8, y: 0.65)
            return w
        }()
        background.addSubview(swichRememberMe!)
        
        let forget:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 770), width: frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 25)))
            l.backgroundColor = UIColor.clear
            l.text = "Forgot Business Username or Password?"
            l.textAlignment = .center
            l.textColor = UIColor.white
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 22.5))
            return l
        }()
        background.addSubview(forget)
        
        let error:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 820), width: frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 25)))
            l.backgroundColor = UIColor.clear
            l.text = "Thong bao loi (neu co)"
            l.textAlignment = .center
            l.textColor = UIColor.red
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 22.5))
            return l
        }()
        background.addSubview(error)
        
        let loginFacebook:FBSDKLoginButton = {
            let l = FBSDKLoginButton(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 875), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 80)))
            l.readPermissions = ["public_profile", "email", "user_friends"]
            l.delegate = self
            l.layer.cornerRadius = 0
            return l
        }()
        background.addSubview(loginFacebook)
        
        let loginGoogle:GIDSignInButton = {
            let l = GIDSignInButton(frame: CGRect(x: 6, y: SizeHelper.heightAsHeightScreen(value: 990), width: background.frame.width - 12, height: SizeHelper.heightAsHeightScreen(value: 80)))
            return l
        }()
        background.addSubview(loginGoogle)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let contactUs:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 1120), width: frame.width / 2 - 10, height: SizeHelper.heightAsHeightScreen(value: 30)))
            l.text = "Contact"
            l.font = UIFont.boldSystemFont(ofSize: SizeHelper.heightAsHeightScreen(value: 30))
            l.textColor = UIColor.white
            return l
        }()
        background.addSubview(contactUs)
        
        let createAnAccount:UILabel = {
            let l = UILabel(frame: CGRect(x: frame.width / 2, y: SizeHelper.heightAsHeightScreen(value: 1120), width: frame.width / 2 - 10, height: SizeHelper.heightAsHeightScreen(value: 30)))
            l.text = "Create an Account"
            l.font = UIFont.boldSystemFont(ofSize: SizeHelper.heightAsHeightScreen(value: 30))
            l.textAlignment = .right
            l.textColor = UIColor.white
            return l
        }()
        background.addSubview(createAnAccount)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!)
    {
        if error == nil
        {
            
        }
        else
        {
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!)
    {
        
    }
    
    /*func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        //self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }*/
}

protocol SignInViewDelegate:class {
    func logInAccount(signInModel:SignInModel)
    func logInWithFacebook()
    func logInWithGoogle()
    func contact()
    func createAnAccount()
}

