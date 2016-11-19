//
//  RegisterView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class RegisterView: UIView{
    weak var delegate:RegisterViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var listItemInfoPerson:[ItemInfoPerson]?
    let listNameIcon:[String] = ["test","test","test","test","","test"]
    let listPlaceHolder:[String] = ["First Name","Last Name","Email","Phone","","Password"]
    var gender:UIContextMenu?
    var language:UIContextMenu?
    func setupViews() {
        backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc)
        let background: UIScrollView = {
            let s = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            return s
        }()
        addSubview(background)
        
        let logo:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 125)))
            v.backgroundColor = UIColor.white
            return v
        }()
        background.addSubview(logo)
        
        listItemInfoPerson = [ItemInfoPerson]()
        var item:ItemInfoPerson?
        for index:Int in 0...5 {
            if index != 4 {
                if index == 5 {
                    item = ItemInfoPerson(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 800), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 76)))
                }else {
                    item = ItemInfoPerson(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value:CGFloat(165 + index*116)), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 76)))
                }
                item!.setupData(nameIcon: listNameIcon[index], placeHolder: listPlaceHolder[index])
                listItemInfoPerson!.append(item!)
                background.addSubview(item!)
            }
        }
        
        gender = {
            let m = UIContextMenu(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 639), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 80)))
            m.backgroundColor = UIColor.white
            m.colorMenu = UIColor.white
            return m
        }()
        gender!.values = [ValueContextMenu(value: "Nam"),ValueContextMenu(value: "Nu"),ValueContextMenu(value: "The gioi thu 3")]
        background.addSubview(gender!)
        
        let buttonRegister:UIButton = {
            let b = UIButton(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 915), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 90)))
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x33cc99)
            b.addTarget(self, action: #selector(RegisterView.registerAccount), for: .touchUpInside)
            b.setTitle("Register", for: UIControlState.normal)
            b.titleLabel!.textAlignment = .center
            b.titleLabel!.textColor = UIColor.white
            return b
        }()
        background.addSubview(buttonRegister)
        
        language = {
            let m = UIContextMenu(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 1031), width: background.frame.width - 20, height: SizeHelper.heightAsHeightScreen(value: 100)))
            m.backgroundColor = UIColor.white
            m.colorMenu = UIColor.white
            return m
        }()
        language!.values = [ValueContextMenu(value: "Tieng Anh"),ValueContextMenu(value: "Tieng Viet")]
        background.addSubview(language!)
    }
    
    func registerAccount(){
        for item in listItemInfoPerson! {
            if item.inputText!.text == "" {
                let alert = UIAlertView()
                alert.title = "Register"
                alert.message = "You haven't filled in the information"
                alert.addButton(withTitle: "OK")
                //alert.show()
                //return
            }
        }
        let registerModel = RegisterModel(email: listItemInfoPerson![2].inputText!.text!, first_name: listItemInfoPerson![0].inputText!.text!, last_name: listItemInfoPerson![1].inputText!.text!, gender: gender!.indexSelected, telephone: listItemInfoPerson![3].inputText!.text!, password_hash: listItemInfoPerson![4].inputText!.text!)
        delegate?.registerAccount(registerModel: registerModel)
    }
}

class ItemInfoPerson:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(nameIcon: String, placeHolder: String) {
        icon!.image = UIImage(named: nameIcon)
        inputText!.attributedPlaceholder = NSAttributedString(string: placeHolder,attributes:[NSForegroundColorAttributeName: UIColor.black])
    }
    
    var icon: UIImageView?
    var inputText: MyUITextField?
    func setupView() {
        icon = {
            let i = UIImageView(frame: CGRect(x: 5, y: 2, width: 25 , height: frame.height - 4))
            return i
        }()
        addSubview(icon!)
        
        inputText = {
            let t = MyUITextField(frame: CGRect(x: 35, y: 0, width: frame.width - 35, height: frame.height))
            t.backgroundColor = UIColor.clear
            return t
        }()
        addSubview(inputText!)
        
        let lineBlack:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
            v.backgroundColor = UIColor.black
            return v
        }()
        addSubview(lineBlack)
    }
}

protocol RegisterViewDelegate:class {
    func registerAccount(registerModel:RegisterModel)
}

