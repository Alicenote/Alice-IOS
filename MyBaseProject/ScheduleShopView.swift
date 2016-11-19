//
//  ScheduleShowView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class ScheduleShopView:UIView {
    weak var delegate:ScheduleShopViewDelegate?
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
            l.text = "When is \"Your Salon\" Open?"
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 45))
            l.textColor = UIColor.white
            l.textAlignment = .center
            return l
        }()
        background.addSubview(logo)
        
        let titles = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        var itemScheduleShopView:ItemScheduleShopView?
        for index:Int in 0...6 {
            itemScheduleShopView = ItemScheduleShopView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: CGFloat(index*120 + 140)), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 120)))
            itemScheduleShopView!.itemScheduleShop = ItemScheduleShop(isChecked: false, title: titles[index], listBeginTime: [ValueContextMenu](), listEndTime: [ValueContextMenu]())
            background.addSubview(itemScheduleShopView!)
        }
        
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
            b.addTarget(self, action: #selector(ScheduleShopView.backClicked), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            return b
        }()
        background.addSubview(buttonBack)
        
        let buttonNext:UIButton = {
            let b = UIButton(frame: CGRect(x: SizeHelper.widthAsWidthScreen(value: 450), y: SizeHelper.heightAsHeightScreen(value: 1015) + 2, width: SizeHelper.widthAsWidthScreen(value: 200), height: SizeHelper.heightAsHeightScreen(value: 90)))
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.setTitle("NEXT", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.addTarget(self, action: #selector(ScheduleShopView.nextClicked), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            return b
        }()
        background.addSubview(buttonNext)
    }
    
    func nextClicked(){
        delegate?.nextFromSchedule()
    }
    
    func backClicked(){
        delegate?.backFromSchedule()
    }
}

protocol ScheduleShopViewDelegate:class {
    func nextFromSchedule()
    func backFromSchedule()
}

class ItemScheduleShop:NSObject {
    var isChecked:Bool?
    var title:String?
    var listBeginTime:[ValueContextMenu]?
    var listEndTime:[ValueContextMenu]?
    init(isChecked:Bool, title:String, listBeginTime:[ValueContextMenu], listEndTime:[ValueContextMenu]) {
        self.title = title
        self.isChecked = isChecked
        self.listBeginTime = listBeginTime
        self.listEndTime = listEndTime
    }
}

class ItemScheduleShopView:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var itemScheduleShop:ItemScheduleShop?{
        didSet{
            checkBox!.isChecked = itemScheduleShop!.isChecked
            titleItem!.text = itemScheduleShop!.title
            beginTime!.values = itemScheduleShop!.listBeginTime
            endTime!.values = itemScheduleShop!.listEndTime
        }
    }
    
    var checkBox:UICheckBox?
    var titleItem:UILabel?
    var beginTime:UIContextMenu?
    var endTime:UIContextMenu?
    func setupViews(){
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            return v
        }()
        addSubview(background)
        
        checkBox = {
            let c = UICheckBox(frame: CGRect(x: 5, y: frame.height/3, width: frame.height/3, height: frame.height/3))
            c.isChecked = false
            return c
        }()
        background.addSubview(checkBox!)
        
        titleItem = {
            let l = UILabel(frame: CGRect(x: 5 + checkBox!.frame.width + 5, y: frame.height/3, width: (frame.width - (5 + checkBox!.frame.width + 5))/3, height: frame.height/3))
            l.text = "TitleItem"
            l.font = UIFont.boldSystemFont(ofSize: frame.height/3 - 5)
            l.textColor = UIColor.black
            return l
        }()
        background.addSubview(titleItem!)
        
        beginTime = {
            let c = UIContextMenu(frame: CGRect(x: 5 + checkBox!.frame.width + 5 + titleItem!.frame.width, y: frame.height/3, width: (frame.width - (5 + checkBox!.frame.width + 5))/3, height: frame.height/3))
            c.title = "09:00"
            c.value!.font = UIFont(name: c.value!.font.fontName, size: frame.height/3 - 5)
            return c
        }()
        background.addSubview(beginTime!)
        
        endTime = {
            let c = UIContextMenu(frame: CGRect(x: 5 + checkBox!.frame.width + 5 + titleItem!.frame.width + beginTime!.frame.width, y: frame.height/3, width: (frame.width - (5 + checkBox!.frame.width + 5))/3, height: frame.height/3))
            c.title = "09:00"
            c.value!.font = UIFont(name: c.value!.font.fontName, size: frame.height/3 - 5)
            return c
        }()
        background.addSubview(endTime!)
    }
}
