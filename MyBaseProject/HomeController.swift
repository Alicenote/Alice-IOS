//
//  HomeController.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class HomeController: BaseControllerViewWithMenu {
    var mainView:MainView?
    var menuView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 20))
        menuView = UIView(frame: CGRect(x: 0, y: 20, width: view.frame.width - 60, height: view.frame.height - 20))
        menuView!.backgroundColor = UIColor.red
        super.setupMainView(mainView: mainView!)
        super.setupLeftView(leftView: menuView!)
    }
}
