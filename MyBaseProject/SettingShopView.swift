//
//  SettingShopView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class SettingShopView:UIView, InfoBaseShopViewDelegate, ScheduleShopViewDelegate, ServiceShopViewDelegate, AddServiceShopViewDelegate, DetailServiceShopViewDelegate{
    var infoBaseShopView:InfoBaseShopView?
    weak var delegate:SettingShopViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        infoBaseShopView = InfoBaseShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
        infoBaseShopView!.delegate = self
        addSubview(infoBaseShopView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Handle events for InfoBaseShopView
    var scheduleShopView:ScheduleShopView?
    func nextFromInfoBaseShop() {
        infoBaseShopView!.alpha = 0
        if scheduleShopView == nil {
            scheduleShopView = ScheduleShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            scheduleShopView?.delegate = self
            addSubview(scheduleShopView!)
        } else{
            scheduleShopView!.alpha = 1
        }
    }
    
    // Handle events for ScheduleShopView
    var serviceShopView:ServiceShopView?
    func nextFromSchedule() {
        scheduleShopView!.alpha = 0
        if serviceShopView == nil {
            serviceShopView = ServiceShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            serviceShopView!.delegate = self
            addSubview(serviceShopView!)
        } else{
            serviceShopView!.alpha = 1
        }
    }
    
    func backFromSchedule() {
        scheduleShopView!.alpha = 0
        infoBaseShopView!.alpha = 1
    }
    
    // Handle events for ServiceShopView
    var detailServiceShopView:DetailServiceShopView?
    func nextFromServiceShopView() {
        serviceShopView!.alpha = 0
        if detailServiceShopView == nil {
            detailServiceShopView = DetailServiceShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            detailServiceShopView!.delegate = self
            addSubview(detailServiceShopView!)
        } else{
            detailServiceShopView!.alpha = 1
        }
    }
    
    func backFromServiceShopView() {
        scheduleShopView!.alpha = 1
        serviceShopView!.alpha = 0
    }
    
    var addServiceShopView:AddServiceShopView?
    func addNailService() {
        serviceShopView!.alpha = 0
        if addServiceShopView == nil {
            addServiceShopView = AddServiceShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            addServiceShopView!.delegate = self
            addSubview(addServiceShopView!)
        } else{
            addServiceShopView!.alpha = 1
        }
    }
    
    func addHairService() {
        serviceShopView!.alpha = 0
        if addServiceShopView == nil {
            addServiceShopView = AddServiceShopView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
            addServiceShopView!.delegate = self
            addSubview(addServiceShopView!)
        } else{
            addServiceShopView!.alpha = 1
        }
    }
    
    // Handle events for AddServiceShopView
    func backFromAddServiceShopView() {
        serviceShopView!.alpha = 1
        addServiceShopView!.alpha = 0
    }
    
    // Handle events for DetailServiceShopView
    func nextFromDetailServiceShopView() {
        delegate?.registerShop(shopModel: ShopModel())
    }
    
    func backFromDetailServiceShopView() {
        serviceShopView!.alpha = 1
        detailServiceShopView!.alpha = 0
    }
}

protocol SettingShopViewDelegate:class {
    func registerShop(shopModel: ShopModel)
}





