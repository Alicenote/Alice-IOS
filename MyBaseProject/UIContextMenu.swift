//
//  UIContextMenu.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class UIContextMenu:UIView, BaseCollectionViewDelegate{
    var values:[ValueContextMenu]? {
        didSet{
            if values!.count != 0{
                value!.text = values![0].value
            }
        }
    }
    
    var colorMenu = UIColor.white{
        didSet{
            if baseCollectionView != nil {
                baseCollectionView!.collectionView.backgroundColor = colorMenu
            }
        }
    }
    
    var title:String? {
        didSet{
            value!.text = title
        }
    }
    
    var heightSelfRoot:CGFloat?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var baseCollectionView:BaseCollectionView?
    var backgroundValue:UIView?
    var value:UILabel?
    func setupViews() {
        heightSelfRoot = frame.height
        backgroundValue = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            return v
        }()
        addSubview(backgroundValue!)
        value = {
            let l = UILabel(frame: CGRect(x: 5, y: 0, width: backgroundValue!.frame.width - 10, height: backgroundValue!.frame.height))
            l.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIContextMenu.handleTapValue)))
            l.backgroundColor = UIColor.clear
            l.isUserInteractionEnabled = true
            return l
        }()
        backgroundValue!.addSubview(value!)
        
        let icon:UIImageView = {
            let i = UIImageView(frame: CGRect(x: backgroundValue!.frame.width - 4*backgroundValue!.frame.height/(3*3) - backgroundValue!.frame.height/3, y: backgroundValue!.frame.height/3, width: 4*backgroundValue!.frame.height/(3*3), height: backgroundValue!.frame.height/3))
            i.image = UIImage(named: "icon-down-context-menu")
            return i
        }()
        backgroundValue!.addSubview(icon)
    }
    
    func handleTapValue() {
        guard let height = baseCollectionView?.frame.height else {
            showListChooseValue()
            return
        }
        
        if height == 0 {
            showListChooseValue()
        }else {
            closeListChooseValue()
        }
    }
    var heightListChosseValue:CGFloat?
    func showListChooseValue() {
        let yPositionSelfAsSystem = frame.origin.y
        guard let count = values?.count else {
            return
        }
        
        if count == 0 {
            return
        } else if(count < 4) {
            heightListChosseValue = CGFloat(count)*frame.height
        } else{
            heightListChosseValue = 4*frame.height
        }
        
        let heightScreen = UIScreen.main.bounds.height - 20
        if heightListChosseValue! < (heightScreen - yPositionSelfAsSystem){
            //showOnBottom()
            showOnTop()
        } else{
            showOnTop()
        }
    }
    
    var isShowOnTop:Bool?
    func showOnTop(){
        isShowOnTop = true
        frame = CGRect(x: frame.origin.x, y: frame.origin.y - heightListChosseValue!, width: frame.width, height: heightSelfRoot! + heightListChosseValue!)
        backgroundValue!.frame.origin.y = heightListChosseValue!
        baseCollectionView = {
            let b = BaseCollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: heightListChosseValue!))
            b.registerClassForCell = [(nameClass: ValueContextMenuCell.self, indentify: "ValueContextMenuCellID")]
            b.dataSizesForCell = [CGSize(width: frame.width, height: heightSelfRoot!)]
            b.delegate = self
            b.collectionView.backgroundColor = colorMenu
            return b
        }()
        baseCollectionView!.dataContentsForBaseCollectionView = [values!]
        addSubview(baseCollectionView!)
    }
    
    func showOnBottom(){
        isShowOnTop = false
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: heightSelfRoot! + heightListChosseValue!)
        baseCollectionView = {
            let b = BaseCollectionView(frame: CGRect(x: 0, y: heightSelfRoot!, width: frame.width, height: heightListChosseValue!))
            b.registerClassForCell = [(nameClass: ValueContextMenuCell.self, indentify: "ValueContextMenuCellID")]
            b.dataSizesForCell = [CGSize(width: frame.width, height: heightSelfRoot!)]
            b.delegate = self
            b.collectionView.backgroundColor = colorMenu
            return b
        }()
        baseCollectionView!.dataContentsForBaseCollectionView = [values!]
        addSubview(baseCollectionView!)
    }
    
    func closeListChooseValue(){
        if isShowOnTop! {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y + heightListChosseValue!, width: frame.width, height: heightSelfRoot!)
            backgroundValue!.frame.origin.y = 0
        }else {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: heightSelfRoot!)
        }
        baseCollectionView!.removeFromSuperview()
        baseCollectionView = nil
    }
    
    var indexSelected:Int = 0
    func didSelectedIndex(indexPath: IndexPath) {
        value!.text = values![indexPath.row].value
        indexSelected = indexPath.row
        DispatchQueue.main.async {
            () -> Void in
            self.closeListChooseValue()
        }
    }
}

class ValueContextMenuCell:BaseCollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupData(data: AnyObject) {
        value!.text = (data as! ValueContextMenu).value
    }
    
    var value:UILabel?
    func setupViews() {
        value = {
            let l = UILabel(frame: CGRect(x: 5, y: 0,width: frame.width - 5, height: frame.height))
            l.textAlignment = .left
            l.textColor = UIColor.black
            return l
        }()
        addSubview(value!)
        
        let line:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
            v.backgroundColor = UIColor.black
            return v
        }()
        addSubview(line)
    }
}

class ValueContextMenu:AnyObject {
    var value:String?
    init(value: String) {
        self.value = value
    }
}

