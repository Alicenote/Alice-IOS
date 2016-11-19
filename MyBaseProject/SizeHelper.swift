//
//  SizeHelper.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import Foundation

class SizeHelper{
    static func heightAsHeightScreen(value: CGFloat) -> CGFloat {
        let valueHeight = value/1170*(UIScreen.main.fixedCoordinateSpace.bounds.height - 20)
        return valueHeight
    }
    
    static func widthAsWidthScreen(value: CGFloat) -> CGFloat {
        let valueWidth = value/700*(UIScreen.main.fixedCoordinateSpace.bounds.width)
        return valueWidth
    }
}
