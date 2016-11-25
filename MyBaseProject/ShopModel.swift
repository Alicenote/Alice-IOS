//
//  ShopModel.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import Foundation

class ShopModel:NSObject{
    var baseInfoShop:BaseInfoShop?
    var baseScheduleShop : BaseScheduleShop?
    var baseServiceShop : BaseServiceShop?
}
//// Info Shop
class BaseInfoShop:NSObject{
    var nameShop : String?
    var bussinessType : Int?
    var stateId : Int?
    var city : String?
    var postcode : Int?
    var address : String?
    init(nameShop : String, bussinessType : Int , stateId : Int , city : String , postcode : Int , address : String ) {
        self.nameShop = nameShop
        self.bussinessType = bussinessType
        self.stateId = stateId
        self.city = city
        self.postcode = postcode
        self.address = address
    }
}
//// Schedule Shop
class BaseScheduleShop : NSObject{
    var day : Int?
    var nameDay : String?
    var openHour : Int?
    var closeHour : Int?
    var status : String?
    init(day : Int , nameDay : String , openHour : Int , closeHour : Int , status : String) {
        self.day = day
        self.nameDay = nameDay
        self.openHour = openHour
        self.closeHour = closeHour
        self.status = status
    }
}


// About Shop Service
class BaseServiceShop : NSObject {
    var baseGroupOfServiceShop : BaseGroupOfServiceShop?
    var baseServicesOfServiceShop : BaseServicesOfServiceShop?
    
}
class BaseGroupOfServiceShop : NSObject{
    var id : Int?
    var name : String?
    init(id : Int , name : String) {
        self.id = id
        self.name = name
    }
}

class BaseServicesOfServiceShop : NSObject {
    var name : String?
    var check : Bool?
    var price : Int?
    var duaration : Int?
    var work : Bool?
    init(name : String , check : Bool , price : Int , duaration : Int , work : Bool) {
        self.name = name
        self.check = check
        self.price = price
        self.duaration = duaration
        self.work = work
    }
    
}


