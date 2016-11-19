//
//  MainView.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/17/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class MainView:UIView, DashboardViewDelegate, DetailAppointmentViewDelegate{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.white
        showDashboardView()
    }
    
    var dashboardView:DashboardView?
    func showDashboardView(){
        if dashboardView == nil {
            dashboardView = DashboardView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 100), width: frame.width, height: frame.height - SizeHelper.heightAsHeightScreen(value: 100)))
            dashboardView!.delegate = self
            addSubview(dashboardView!)
        } else{
            dashboardView!.alpha = 1
        }
    }
    
    // Event from dashboard view
    func itemDidSelecte(itemDashboardModel: ItemDashboardModel) {
        dashboardView!.alpha = 0
        showDetailAppointmentView()
    }
    
    var detailAppointmentView:DetailAppointmentView?
    func showDetailAppointmentView(){
        if detailAppointmentView == nil {
            detailAppointmentView = DetailAppointmentView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            detailAppointmentView!.delegate = self
            addSubview(detailAppointmentView!)
        } else{
            detailAppointmentView!.alpha = 1
        }
    }
    
    func checkoutClicked() {
        detailAppointmentView!.alpha = 0
        showCheckoutAppointmentView()
    }
    
    // Event from DetailAppointmentView
    var checkoutAppointmentView:CheckoutAppointmentView?
    func showCheckoutAppointmentView() {
        if checkoutAppointmentView == nil {
            checkoutAppointmentView = CheckoutAppointmentView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(checkoutAppointmentView!)
        } else{
            checkoutAppointmentView!.alpha = 1
        }
    }
}
