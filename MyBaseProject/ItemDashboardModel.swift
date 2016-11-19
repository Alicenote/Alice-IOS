//
//  ItemDashboardModel.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/17/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class ItemDashboardModel {
    var nameService:String?
    var nameCustomer:String?
    var date:String?
    var time:String?
    var duration:String?
    var id:String?
    init(nameService:String, nameCustomer:String, date:String, time:String, duration:String, id:String) {
        self.nameService = nameService
        self.nameCustomer = nameCustomer
        self.date = date
        self.time = time
        self.duration = duration
        self.id = id
    }
}
