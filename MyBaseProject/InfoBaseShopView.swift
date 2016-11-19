//
//  InfoBaseShopView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class InfoBaseShopView:UIView {
    weak var delegate:InfoBaseShopViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        setupInfoBaseShopViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfoBaseShopViews(){
        backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc)
        let background: UIView = {
            let s = UIView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            return s
        }()
        addSubview(background)
        
        let logo:UILabel = {
            let l = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 140)))
            l.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x003366)
            l.text = "Wellcome to AliceNote"
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 45))
            l.textColor = UIColor.white
            l.textAlignment = .center
            return l
        }()
        background.addSubview(logo)
        
        let icons = ["test","test","test","test","test","test"]
        let titles = ["Bussiness Name","Bessiness Type","State","City","Post code","Address"]
        let placeholders = ["Bussiness Name","Bessiness Type","State","City","Post code","Address"]
        var itemInfoBaseShopView:ItemInfoBaseShopView?
        var itemInfoBaseShop:ItemInfoBaseShop?
        var isInputText:Bool?
        for index:Int in 0...5 {
            if index == 1 || index == 2 {
                isInputText = false
            }else {
                isInputText = true
            }
            itemInfoBaseShop = ItemInfoBaseShop(title: titles[index], icon: icons[index], placeHolder: placeholders[index])
            itemInfoBaseShopView = ItemInfoBaseShopView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: CGFloat((index + 1)*140)), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 140)),isInputText: isInputText!)
            itemInfoBaseShopView!.itemInfoBaseShop = itemInfoBaseShop
            background.addSubview(itemInfoBaseShopView!)
        }
        
        let line: UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 7*140), width: frame.width, height: 2))
            v.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x003366)
            return v
        }()
        background.addSubview(line)
        
        let buttonNext:UIButton = {
            let b = UIButton(frame: CGRect(x: SizeHelper.widthAsWidthScreen(value: 450), y: SizeHelper.heightAsHeightScreen(value: 1015) + 2, width: SizeHelper.widthAsWidthScreen(value: 200), height: SizeHelper.heightAsHeightScreen(value: 90)))
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.setTitle("NEXT", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.addTarget(self, action: #selector(InfoBaseShopView.nextClicked), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            return b
        }()
        background.addSubview(buttonNext)
    }
    
    func nextClicked(){
        delegate?.nextFromInfoBaseShop()
    }
}

protocol InfoBaseShopViewDelegate:class {
    func nextFromInfoBaseShop()
}

class ItemInfoBaseShop:NSObject {
    var title:String?
    var icon:String?
    var placeHolder:String?
    init(title:String, icon:String, placeHolder:String) {
        self.title = title
        self.icon = icon
        self.placeHolder = placeHolder
    }
}

class ItemInfoBaseShopView:UIView {
    var itemInfoBaseShop:ItemInfoBaseShop?{
        didSet {
            iconInfo!.image = UIImage(named:itemInfoBaseShop!.icon!)
            titleInfo!.text = "  \(itemInfoBaseShop!.title!)"
            if isInputText! {
                valueInfoInputText!.attributedPlaceholder = NSAttributedString(string:itemInfoBaseShop!.placeHolder!,attributes:[NSForegroundColorAttributeName: UIColor.black])
            } else{
                
            }
        }
    }
    
    var isInputText:Bool?
    init(frame: CGRect, isInputText: Bool){
        super.init(frame: frame)
        self.isInputText = isInputText
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var iconInfo:UIImageView?
    var titleInfo:UILabel?
    var valueInfoInputText:MyUITextField?
    var valueInfoContextMenu:UIContextMenu?
    func setupViews(){
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            v.backgroundColor = UIColor.white
            return v
        }()
        addSubview(background)
        
        titleInfo = {
            let l = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height*3/7))
            l.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc)
            l.font = UIFont(name: l.font.fontName, size: frame.height*3/14)
            l.textColor = UIColor.black
            return l
        }()
        background.addSubview(titleInfo!)
        
        iconInfo = {
            let i = UIImageView(frame: CGRect(x: 0, y: frame.height*3/7, width: frame.width/5 , height: frame.height*4/7))
            i.contentMode = UIViewContentMode.scaleAspectFit
            return i
        }()
        background.addSubview(iconInfo!)
        
        let lineHorizontal:UIView = {
            let v = UIView(frame: CGRect(x: frame.width/5, y: frame.height*3/7, width: 1 , height: frame.height*4/7))
            v.backgroundColor = UIColor.black
            return v
        }()
        background.addSubview(lineHorizontal)
        
        if isInputText! {
            valueInfoInputText = {
                let t = MyUITextField(frame: CGRect(x: frame.width/5 + 1, y: frame.height*3/7, width: frame.width*4/5 - 1, height: frame.height*4/7))
                t.backgroundColor = UIColor.clear
                t.textColor = UIColor.black
                t.attributedPlaceholder = NSAttributedString(string:"placeholder text",attributes:[NSForegroundColorAttributeName: UIColor.black])
                t.font = UIFont(name: t.font!.fontName, size: frame.height*4/14)
                return t
            }()
            background.addSubview(valueInfoInputText!)
        }else {
            valueInfoContextMenu = {
                let m = UIContextMenu(frame: CGRect(x: frame.width/5 + 1, y: frame.height*3/7, width: frame.width*4/5 - 1, height: frame.height*4/7))
                return m
            }()
            background.addSubview(valueInfoContextMenu!)
        }
        
    }
}
