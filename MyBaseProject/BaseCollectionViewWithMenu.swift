//
//  UICollectionViewWithMenu.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/18/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class BaseControllerViewWithMenu: UIViewController{
    var backgroundMainView:UIView?
    var backgroundLeftView:UIView?
    var blackLeftView:UIView?
    var leftView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupEvents()
    }
    
    func setupViews(){
        // View contain content of mainView
        backgroundMainView = {
            let v = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height))
            return v
        }()
        self.view.addSubview(backgroundMainView!)
        
        // View contain content of menuView
        backgroundLeftView = {
            let v = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height))
            return v
        }()
        self.view.addSubview(backgroundLeftView!)
        
        // Black background of menuView
        // When tapped it, the menu will be closed
        blackLeftView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: backgroundLeftView!.frame.width, height: backgroundLeftView!.frame.height))
            v.backgroundColor = UIColor(white: 0, alpha: 0.5)
            v.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(closeMenu)))
            return v
        }()
        backgroundLeftView!.addSubview(blackLeftView!)
    }
    
    func setupEvents(){
        // Setup dragging on menuView to close or open menu
        let panMenuView = UIPanGestureRecognizer(target: self, action: #selector(BaseControllerViewWithMenu.leftViewPanGestureRecognizer))
        panMenuView.minimumNumberOfTouches = 1
        panMenuView.maximumNumberOfTouches = 1
        self.backgroundLeftView!.addGestureRecognizer(panMenuView)
        
        // Setup dragging on mainView to close or open menu
        let panMainView = UIPanGestureRecognizer(target: self, action: #selector(BaseControllerViewWithMenu.mainViewPanGestureRecognizer))
        panMainView.minimumNumberOfTouches = 1
        panMainView.maximumNumberOfTouches = 1
        self.backgroundMainView!.addGestureRecognizer(panMainView)
    }
    
    // Setup content for mainView from controller
    func setupMainView(mainView: UIView){
        self.backgroundMainView!.addSubview(mainView)
    }
    
    // Setup content for menuView from controller
    func setupLeftView(leftView: UIView) {
        self.leftView = leftView
        backgroundLeftView!.addSubview(leftView)
        //blackLeftView!.alpha = 0
        //backgroundLeftView!.frame.origin.x = -(leftView.frame.width)
    }
    
    // Handle open Menu
    func openMenu(){
        self.backgroundLeftView!.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackLeftView!.alpha = 1
            self.leftView!.frame.origin.x = 0
        }) {(completed :Bool) in
            
        }
    }
    
    // Handle close Menu
    func closeMenu(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackLeftView!.alpha = 0
            self.leftView!.frame.origin.x = -self.leftView!.frame.width
        }) {(completed :Bool) in
            self.backgroundLeftView!.alpha = 0
        }
    }
    
    // Handle drag on MenuView
    var currentX:CGFloat?
    func leftViewPanGestureRecognizer(rec:UIPanGestureRecognizer) {
        let p:CGPoint = rec.location(in: self.backgroundLeftView)
        switch rec.state {
        case .began:
            currentX = p.x
            break
        case .changed:
            if currentX!
                
                < p.x
            {
                self.leftView!.frame.origin.x = 0
            }
            else if self.leftView!.frame.width < (currentX! - p.x)
            {
                self.leftView!.frame .origin.x = self.leftView!.frame.width
            }
            else
            {
                self.leftView!.frame.origin.x = -(currentX! - p.x)
                self.blackLeftView!.alpha = 1 - (currentX! - p.x)/self.leftView!.frame.width
            }
            break
        case .ended:
            if (currentX! - p.x) < (self.leftView!.frame.width / 2) {
                openMenu()
            }
            else
            {
                closeMenu()
            }
            break
        default:
            break
        }
    }
    
    // Handle drag on MainView
    func mainViewPanGestureRecognizer(rec: UIPanGestureRecognizer){
        let p:CGPoint = rec.location(in: self.backgroundMainView!)
        switch rec.state {
        case .began:
            currentX = p.x
            if currentX! < CGFloat(30) {
                self.backgroundLeftView!.alpha = 1
            }
            break
        case .changed:
            if p.x < currentX! {
                self.leftView!.frame.origin.x = -self.leftView!.frame.width
                self.blackLeftView!.alpha = 0
            }
            else if self.leftView!.frame.width < (p.x - currentX!)
            {
                self.leftView!.frame.origin.x = 0
                self.blackLeftView!.alpha = 1
            }
            else {
                let d = -self.leftView!.frame.width + p.x - currentX!
                self.leftView!.frame.origin.x = d
                self.blackLeftView!.alpha = (p.x - currentX!)/self.leftView!.frame.width
            }
            break
        case .ended:
            if currentX! < CGFloat(30) {
                if self.leftView!.frame.width/2 < (p.x - currentX!){
                    openMenu()
                }
                else
                {
                    closeMenu()
                }
            }
            else {
                closeMenu()
            }
            break
        default:
            break
        }
    }
}

