//
//  DetailServiceShopView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class DetailServiceShopView: UIView,BaseCollectionViewDelegate {
    weak var delegate:DetailServiceShopViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        setupInfoBaseShopViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var listNailService = [ItemDetailService(title: "Specialty Manicures"),ItemDetailService(title: "Manicures"),ItemDetailService(title: "Polish Changes"),ItemDetailService(title: "Pedicures"),ItemDetailService(title: "SBrush-on gel-polish/hybrid gels"),ItemDetailService(title: "Pink-and-white Acrylics"),ItemDetailService(title: "Specialty Manicures")]
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
            l.text = "Prices and durations\n of services at \"Your Salon\""
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 45))
            l.textColor = UIColor.white
            l.textAlignment = .center
            l.numberOfLines = 2
            return l
        }()
        background.addSubview(logo)
        
        let listServiceCurrent:BaseCollectionViewWithContextMenu = {
            let v = BaseCollectionViewWithContextMenu(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 140), width: background.frame.width, height: SizeHelper.heightAsHeightScreen(value: 820)))
            return v
        }()
        let settingItemDetailServiceView:SettingItemDetailServiceView = SettingItemDetailServiceView(frame: CGRect(x: 0, y: 0, width: background.frame.width, height: background.frame.height/4))
        listServiceCurrent.setupContextMenuView(contextMenuView: settingItemDetailServiceView)
        var listServiceCurrentView = [ItemDetailServiceCell]()
        var itemDetailServiceCell:ItemDetailServiceCell?
        for item in listNailService {
            itemDetailServiceCell = ItemDetailServiceCell(frame: CGRect(x: 0, y: 0, width: background.frame.width, height: SizeHelper.heightAsHeightScreen(value: 100) + 10))
            itemDetailServiceCell!.setupData(data: item)
            listServiceCurrentView.append(itemDetailServiceCell!)
        }
        listServiceCurrent.reloadData(listSubView: listServiceCurrentView)
        background.addSubview(listServiceCurrent)
        
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
            b.addTarget(self, action: #selector(DetailServiceShopView.backClicked), for: UIControlEvents.touchUpInside)
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
            b.addTarget(self, action: #selector(DetailServiceShopView.nextClicked), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            return b
        }()
        background.addSubview(buttonNext)
    }
    
    var settingItemDetailServiceView:SettingItemDetailServiceView?
    func showSettingItemDetailServiceView(){
        guard (settingItemDetailServiceView != nil) else {
            settingItemDetailServiceView = SettingItemDetailServiceView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(settingItemDetailServiceView!)
            return
        }
        settingItemDetailServiceView!.alpha = 1
    }
    
    func nextClicked(){
        delegate?.nextFromDetailServiceShopView()
    }
    
    func backClicked(){
        delegate?.backFromDetailServiceShopView()
    }
    
    func didSelectedIndex(indexPath: IndexPath) {
        showSettingItemDetailServiceView()
    }
}

protocol DetailServiceShopViewDelegate:class {
    func nextFromDetailServiceShopView()
    func backFromDetailServiceShopView()
}
class ItemDetailService: NSObject {
    var title:String?
    init(title:String) {
        self.title = title
    }
}

class ItemDetailServiceCell: UIView {
    var itemService:ItemDetailService?{
        didSet{
            title!.text = itemService!.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: ItemDetailService) {
        itemService = data
    }
    
    var title:UILabel?
    func setupViews() {
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: 5, width: frame.width - 20, height: frame.height - 10))
            v.backgroundColor = UIColor.white
            v.layer.cornerRadius = 5
            return v
        }()
        addSubview(background)
        
        title = {
            let l = UILabel(frame: CGRect(x: 20, y: 0,width: background.frame.width - 40, height: background.frame.height))
            l.textAlignment = .left
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height/3)
            return l
        }()
        background.addSubview(title!)
    }
}

class SettingItemDetailServiceView:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title:UILabel?
    func setupViews(){
        backgroundColor = UIColor.clear
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: 0, width: frame.width - 20, height: frame.height))
            v.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0x003366)
            v.alpha = 1
            v.layer.cornerRadius = 5
            return v
        }()
        addSubview(background)
        
        let titlePrice:UILabel = {
            let l = UILabel(frame: CGRect(x: 0, y: 0, width: background.frame.width/2, height: background.frame.height / 3))
            l.backgroundColor = UIColor.clear
            l.textAlignment = .center
            l.textColor = UIColor.gray
            l.text = "Price($)"
            l.font = UIFont(name: l.font.fontName, size: background.frame.height/8)
            return l
        }()
        background.addSubview(titlePrice)
        
        let titleDuration:UILabel = {
            let l = UILabel(frame: CGRect(x: background.frame.width/2, y: 0, width: background.frame.width/2, height: background.frame.height / 3))
            l.backgroundColor = UIColor.clear
            l.textAlignment = .center
            l.textColor = UIColor.gray
            l.text = "Duration"
            l.font = UIFont(name: l.font.fontName, size: background.frame.height/8)
            return l
        }()
        background.addSubview(titleDuration)
        
        let valuePrice:MyUITextField = {
            let l = MyUITextField(frame: CGRect(x: 15, y: background.frame.height / 3 + (background.frame.height / 3 - background.frame.height / 6)/2, width: background.frame.width/2 - 30, height: background.frame.height / 6))
            l.backgroundColor = UIColor.white
            l.textColor = UIColor.black
            l.placeholder = "Prices"
            l.font = UIFont(name: l.font!.fontName, size: background.frame.height/8)
            return l
        }()
        background.addSubview(valuePrice)
        
        let valueDuration:UIContextMenu = {
            let m = UIContextMenu(frame: CGRect(x: background.frame.width/2 + 15, y: background.frame.height / 3 + (background.frame.height / 3 - background.frame.height / 6)/2, width: background.frame.width/2 - 30, height: background.frame.height / 6))
            m.backgroundColor = UIColor.white
            m.colorMenu = UIColor.white
            m.title = "09:00"
            return m
        }()
        background.addSubview(valueDuration)
        
        let checkBox:UICheckBox = {
            let c = UICheckBox(frame: CGRect(x: 15, y: 2 * background.frame.height / 3 + (background.frame.height / 3 - background.frame.height / 6)/2, width: frame.height/8, height: background.frame.height/8))
            c.isChecked = false
            return c
        }()
        background.addSubview(checkBox)
        
        let titleBossVanBoss:UILabel = {
            let l = UILabel(frame: CGRect(x: 15 + background.frame.height / 8 + 15, y: 2 * background.frame.height / 3 + (background.frame.height / 3 - background.frame.height / 6)/2, width: background.frame.width - (15 + background.frame.height / 8 + 15), height: background.frame.height / 8))
            l.backgroundColor = UIColor.clear
            l.textAlignment = .left
            l.textColor = UIColor.white
            l.text = "Boss Van Boss"
            l.font = UIFont(name: l.font.fontName, size: background.frame.height/8)
            return l
        }()
        background.addSubview(titleBossVanBoss)
    }
}











