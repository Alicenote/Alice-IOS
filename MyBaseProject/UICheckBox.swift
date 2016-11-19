//
//  UICheckBox.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/12/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class UICheckBox:UIView {
    let nameIconCheckBox = "checkbox-icon"
    let nameIconUncheckBox = "uncheckbox-icon"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var button:UIButton?
    func setupViews(){
        button = {
            let b = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            b.setImage(UIImage(named: nameIconUncheckBox), for: UIControlState.normal)
            b.addTarget(self, action: #selector(clicked), for: UIControlEvents.touchUpInside)
            return b
        }()
        addSubview(button!)
    }
    
    var isChecked:Bool? {
        didSet{
            if isChecked! {
                button!.setImage(UIImage(named: nameIconCheckBox), for: UIControlState.normal)
            } else{
                button!.setImage(UIImage(named: nameIconUncheckBox), for: UIControlState.normal)
            }
        }
    }
    
    func clicked(){
        if isChecked! {
            isChecked = false
        } else {
            isChecked = true
        }
    }
}
