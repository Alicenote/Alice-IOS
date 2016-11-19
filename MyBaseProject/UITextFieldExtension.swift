//
//  UITextFieldExtension.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit
class MyUITextField : UITextField, UITextFieldDelegate {
    var leftTextMargin : CGFloat = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        self.resignFirstResponder()
        return true;
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
}
