//
//  SignUpController.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, SignUpViewDelegate, RegisterViewDelegate, SignInViewDelegate, SettingShopViewDelegate{
    var signUpView: SignUpView?
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView = SignUpView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 20))
        signUpView!.delegate = self
        view.addSubview(signUpView!)
    }
    
    func selectedLogIn(){
        signUpView!.alpha = 0
        let loginView = SignInView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 20))
        view.addSubview(loginView)
    }
    
    var registerView:RegisterView?
    func selectedSignUp() {
        signUpView!.alpha = 0
        registerView = RegisterView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 20))
        registerView!.delegate = self
        view.addSubview(registerView!)
    }
    
    func registerAccount(registerModel: RegisterModel) {
        self.registerView!.alpha = 0
        let settingShopView = SettingShopView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        settingShopView.delegate = self
        self.view.addSubview(settingShopView)
        //SignUpHelper.sharedInstance.registerAccount(registerModel: registerModel, result: {(isError,message,token,id) -> Void in
            /*if isError {
                DispatchQueue.main.async {
                    () -> Void in
                    let alert = UIAlertView(title: "Register", message: message, delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            }else {
                DispatchQueue.main.async {
                    () -> Void in
                    UserDefaults.standard.set(true, forKey: Constant.isSignUp)
                    UserDefaults.standard.set(token, forKey: Constant.token)
                    UserDefaults.standard.set(id, forKey: Constant.id)
                    self.registerView!.alpha = 0
                    let settingShopView = SettingShopView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
                    self.view.addSubview(settingShopView)
                }
            }*/
        //})
    }
    
    func logInAccount(signInModel: SignInModel) {
        SignUpHelper.sharedInstance.loginAccount(signInModel: signInModel, result: {(isError,message,token,id) -> Void in
            if isError {
                DispatchQueue.main.async {
                    () -> Void in
                    let alert = UIAlertView(title: "Login", message: message, delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            }else {
                DispatchQueue.main.async {
                    () -> Void in
                    UserDefaults.standard.set(true, forKey: Constant.isSignUp)
                    UserDefaults.standard.set(token, forKey: Constant.token)
                    UserDefaults.standard.set(id, forKey: Constant.id)
                }
            }
        })
    }
    
    func logInWithGoogle() {
        
    }
    
    func logInWithFacebook() {
        
    }
    
    func contact() {
        
    }
    
    func createAnAccount() {
        
    }
    
    func registerShop(shopModel: ShopModel){
        print("Register shop!")
    }
}

