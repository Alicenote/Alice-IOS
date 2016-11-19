//
//  AddServiceView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit
class AddServiceShopView: UIView {
    weak var delegate:AddServiceShopViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        setupInfoBaseShopViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var listNailService = [ItemService(title: "Specialty Manicures", isChecked: false),ItemService(title: "Manicures", isChecked: false),ItemService(title: "Polish Changes", isChecked: false),ItemService(title: "Pedicures", isChecked: false),ItemService(title: "SBrush-on gel-polish/hybrid gels", isChecked: false),ItemService(title: "Pink-and-white Acrylics", isChecked: false),ItemService(title: "Specialty Manicures", isChecked: false),]
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
            l.text = "Nail Services"
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 45))
            l.textColor = UIColor.white
            l.textAlignment = .center
            l.numberOfLines = 1
            return l
        }()
        background.addSubview(logo)
        
        let listServiceCurrent:BaseCollectionView = {
            let v = BaseCollectionView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 140), width: background.frame.width, height: SizeHelper.heightAsHeightScreen(value: 705)))
            v.dataSizesForCell = [CGSize(width: background.frame.width, height: SizeHelper.heightAsHeightScreen(value: 100) + 10)]
            v.registerClassForCell = [(nameClass: ItemServiceCell.self, indentify: "ItemServiceCellID")]
            return v
        }()
        listServiceCurrent.dataContentsForBaseCollectionView = [listNailService]
        listServiceCurrent.collectionView.backgroundColor = UIColor.clear
        background.addSubview(listServiceCurrent)
        
        let nameServiceInputText:MyUITextField = {
            let t = MyUITextField(frame: CGRect(x: 20, y: SizeHelper.heightAsHeightScreen(value: 875), width: background.frame.width - 100, height: SizeHelper.heightAsHeightScreen(value: 73)))
            t.backgroundColor = UIColor.clear
            t.textColor = UIColor.black
            t.attributedPlaceholder = NSAttributedString(string:"Add nail service",attributes:[NSForegroundColorAttributeName: UIColor.white])
            t.font = UIFont(name: t.font!.fontName, size: SizeHelper.heightAsHeightScreen(value: 73)/2)
            return t
        }()
        background.addSubview(nameServiceInputText)
        
        let buttonAdd:UIButton = {
            let b = UIButton(frame: CGRect(x: background.frame.width - 80, y: SizeHelper.heightAsHeightScreen(value: 875), width: 60, height: SizeHelper.heightAsHeightScreen(value: 73)))
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.titleLabel!.font = UIFont(name: b.titleLabel!.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 73)/2)
            b.setTitle("ADD", for: UIControlState.normal)
            b.setTitleColor(UIColor.black, for: UIControlState.normal)
            b.addTarget(self, action: #selector(AddServiceShopView.addService), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xE5E5E5)
            return b
        }()
        background.addSubview(buttonAdd)
        
        let line: UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 140 + 7*120), width: frame.width, height: 2))
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
            b.addTarget(self, action: #selector(AddServiceShopView.backClicked), for: UIControlEvents.touchUpInside)
            b.backgroundColor = UIColor.rgbFromHexExtension(rgbValue: 0xcccccc, alpha: 1)
            return b
        }()
        background.addSubview(buttonBack)
    }
    
    func backClicked(){
        delegate?.backFromAddServiceShopView()
    }
    
    func addService(){
        
    }
}

protocol AddServiceShopViewDelegate:class {
    func backFromAddServiceShopView()
}

class ItemService: NSObject {
    var title:String?
    var isChecked:Bool?
    init(title:String, isChecked:Bool) {
        self.title = title
        self.isChecked = isChecked
    }
}

class ItemServiceCell: BaseCollectionViewCell {
    var itemService:ItemService?{
        didSet{
            title!.text = itemService!.title
            checkBox!.isChecked = itemService!.isChecked
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupData(data: AnyObject) {
        itemService = (data as! ItemService)
    }
    
    var title:UILabel?
    var checkBox:UICheckBox?
    func setupViews() {
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: 5, width: frame.width - 20, height: frame.height - 10))
            v.backgroundColor = UIColor.white
            v.layer.cornerRadius = 5
            return v
        }()
        addSubview(background)
        
        title = {
            let l = UILabel(frame: CGRect(x: 20, y: 0,width: background.frame.width - 40 - background.frame.height/3, height: background.frame.height))
            l.textAlignment = .left
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height/3)
            return l
        }()
        background.addSubview(title!)
        
        checkBox = {
            let c = UICheckBox(frame: CGRect(x: background.frame.width - 10 - background.frame.height/3, y: background.frame.height/3,width: background.frame.height/3, height: background.frame.height/3))
            return c
        }()
        background.addSubview(checkBox!)
    }
}
