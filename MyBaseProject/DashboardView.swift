//
//  DashboardView.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/17/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class DashboardView:UIView, BaseCollectionViewHeaderSelectionDelegate, BaseCollectionViewHeaderSelectionDataSource{
    let listTitleSection = ["Upcoming Appointments","This Week's Appointments"]
    var listContentDashboard = [[ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100")],[ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100"),ItemDashboardModel(nameService: "Classical Manicures", nameCustomer: "With Cindy Vo", date: "Mon,Sep 29", time: "09:30", duration: "30 mins", id: "100")]]
    
    weak var delegate:DashboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dashboardView:BaseCollectionViewWithHeaderSelection?
    func setupViews(){
        dashboardView = BaseCollectionViewWithHeaderSelection(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        dashboardView!.delegate = self
        dashboardView!.dataSource = self
        addSubview(dashboardView!)
        dashboardView!.reloadData()
    }
    
    func sectionViewAtIndex(index: Int) -> UIView {
        let sectionView:TitleSectionView = TitleSectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 70)))
        sectionView.title!.text = listTitleSection[index]
        return sectionView
    }
    
    func itemViewAtIndexPath(indexPath: IndexPath) -> UIView {
        let itemDashboardView:ItemDashboardView = ItemDashboardView(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 140)))
        itemDashboardView.itemDashboardModel = listContentDashboard[indexPath.section][indexPath.row]
        return itemDashboardView
    }
    
    func countSection() -> Int {
        return listTitleSection.count
    }
    
    func countItemInSection(index: Int) -> Int {
        if index < listContentDashboard.count {
            return listContentDashboard[index].count
        }
        return 0
    }
    
    func didSectionSelected(index: Int) {
        
    }
    
    func didItemSelected(indexPath: IndexPath) {
        delegate?.itemDidSelecte(itemDashboardModel: listContentDashboard[indexPath.section][indexPath.row])
    }
}

protocol DashboardViewDelegate:class {
    func itemDidSelecte(itemDashboardModel:ItemDashboardModel)
}

class TitleSectionView:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title:UILabel?
    func setupViews(){
        backgroundColor = UIColor.gray
        title = {
            let l = UILabel(frame: CGRect(x: 20, y: 0, width: frame.width - 20, height: frame.height))
            l.font = UIFont(name: l.font.fontName, size: frame.height / 2)
            l.textColor = UIColor.black
            l.backgroundColor = UIColor.clear
            return l
        }()
        addSubview(title!)
        
        let line:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
            v.backgroundColor = UIColor.black
            return v
        }()
        addSubview(line)
    }
}

class ItemDashboardView:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var itemDashboardModel:ItemDashboardModel?{
        didSet{
            nameService!.text = itemDashboardModel!.nameService
            nameCustomer!.text = itemDashboardModel!.nameCustomer
            date!.text = itemDashboardModel!.date
            time!.text = itemDashboardModel!.time
            duration!.text = itemDashboardModel!.duration
        }
    }
    
    var nameService:UILabel?
    var nameCustomer:UILabel?
    var date:UILabel?
    var time:UILabel?
    var duration:UILabel?
    func setupViews(){
        let background:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: frame.height/12, width: frame.width, height: 10 * frame.height / 12))
            return v
        }()
        addSubview(background)
        
        nameService = {
            let l = UILabel(frame: CGRect(x: 0, y: 0, width: (background.frame.width - 30) / 2, height: background.frame.height / 2))
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height / 5)
            l.textAlignment = .center
            return l
        }()
        background.addSubview(nameService!)
        
        nameCustomer = {
            let l = UILabel(frame: CGRect(x: 0, y: background.frame.height / 2, width: (background.frame.width - 30) / 2, height: background.frame.height / 2))
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height / 5)
            l.textAlignment = .center
            return l
        }()
        background.addSubview(nameCustomer!)
        
        date = {
            let l = UILabel(frame: CGRect(x: (background.frame.width - 30) / 2, y: 0, width: (background.frame.width - 30) / 3, height: background.frame.height / 2))
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height / 5)
            l.textAlignment = .center
            return l
        }()
        background.addSubview(date!)
        
        time = {
            let l = UILabel(frame: CGRect(x: 5 * (background.frame.width - 30) / 6, y: 0, width: (background.frame.width - 30) / 6, height: background.frame.height / 2))
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height / 5)
            l.textAlignment = .center
            return l
        }()
        background.addSubview(time!)
        
        duration = {
            let l = UILabel(frame: CGRect(x: (background.frame.width - 30) / 2, y: background.frame.height / 2, width: (background.frame.width - 30) / 2, height: background.frame.height / 2))
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: background.frame.height / 5)
            l.textAlignment = .center
            return l
        }()
        background.addSubview(duration!)
    }
}











