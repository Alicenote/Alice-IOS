//
//  AddServiceView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit
class ServiceShopView: UIView {
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
            l.text = "What services does\n\"Your Salon\" provide?"
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 45))
            l.textColor = UIColor.white
            l.textAlignment = .center
            l.numberOfLines = 2
            return l
        }()
        background.addSubview(logo)
        
        let buttonNail:UIButton = {
            let b = UIButton(frame: CGRect(x: 5, y: SizeHelper.heightAsHeightScreen(value: 140) + 10, width: background.frame.width - 10, height: (SizeHelper.heightAsHeightScreen(value: 840) - 30) / 2))
            b.layer.borderWidth = 2
            b.layer.borderColor = UIColor.black.cgColor
            b.setImage(UIImage(named:"nail-service"), for: UIControlState.normal)
            b.addTarget(self, action: #selector(ServiceShopView.nailServiceClicked), for: UIControlEvents.touchUpInside)
            return b
        }()
        background.addSubview(buttonNail)
        
        let buttonHair:UIButton = {
            let b = UIButton(frame: CGRect(x: 5, y: SizeHelper.heightAsHeightScreen(value: 140) + 20 + (SizeHelper.heightAsHeightScreen(value: 840) - 30) / 2, width: background.frame.width - 10, height: (SizeHelper.heightAsHeightScreen(value: 840) - 30) / 2))
            b.layer.borderWidth = 2
            b.layer.borderColor = UIColor.black.cgColor
            b.setImage(UIImage(named:"hair-service"), for: UIControlState.normal)
            b.addTarget(self, action: #selector(ServiceShopView.hairServiceClicked), for: UIControlEvents.touchUpInside)
            return b
        }()
        background.addSubview(buttonHair)
        
        let line: UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 140) + CGFloat(7)*SizeHelper.heightAsHeightScreen(value: 120), width: frame.width, height: 2))
            v.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x003366)
            return v
        }()
        background.addSubview(line)
        
        let buttonBack:UIButton = {
            let b = UIButton(frame: CGRect(x: SizeHelper.widthAsWidthScreen(value: 50), y: SizeHelper.heightAsHeightScreen(value: 1015) + 2, width: SizeHelper.widthAsWidthScreen(value: 200), height: SizeHelper.heightAsHeightScreen(value: 90)))
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.setTitle("BACK", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.addTarget(self, action: #selector(ServiceShopView.backClicked), for: UIControlEvents.touchUpInside)
            return b
        }()
        background.addSubview(buttonBack)
        
        let buttonNext:UIButton = {
            let b = UIButton(frame: CGRect(x: SizeHelper.widthAsWidthScreen(value: 450), y: SizeHelper.heightAsHeightScreen(value: 1015) + 2, width: SizeHelper.widthAsWidthScreen(value: 200), height: SizeHelper.heightAsHeightScreen(value: 90)))
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.setTitle("NEXT", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.addTarget(self, action: #selector(ServiceShopView.nextClicked), for: UIControlEvents.touchUpInside)
            return b
        }()
        background.addSubview(buttonNext)
    }
    
    func nextClicked(){
        
    }
    
    func backClicked(){
        
    }
    
    func nailServiceClicked(){
        
    }
    
    func hairServiceClicked(){
        
    }
}
