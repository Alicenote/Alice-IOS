//
//  RegisterModel.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class RegisterModel:NSObject {
    var email:String?
    var first_name:String?
    var last_name:String?
    var gender:Int?
    var telephone:String?
    var password_hash:String?
    init(email:String, first_name:String, last_name:String, gender:Int, telephone:String, password_hash:String){
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.gender = gender
        self.telephone = telephone
        self.password_hash = password_hash
    }
}
