//
//  DetailAppointmentView.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/17/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class DetailAppointmentView:UIView {
    weak var delegate:DetailAppointmentViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        // Setup views for navigationbar on top
        let backgroundNavigationOnTop:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 100)))
            v.backgroundColor = UIColor.gray
            return v
        }()
        addSubview(backgroundNavigationOnTop)
        
        let buttonCancel:UIButton = {
            let b = UIButton(frame: CGRect(x: 10, y: 10, width: SizeHelper.widthAsWidthScreen(value: 150), height: backgroundNavigationOnTop.frame.height - 20))
            b.setTitle("Cancel", for: UIControlState.normal)
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.titleLabel!.font = UIFont(name: b.titleLabel!.font.fontName, size: (backgroundNavigationOnTop.frame.height - 20)/2)
            return b
        }()
        backgroundNavigationOnTop.addSubview(buttonCancel)
        
        let buttonSave:UIButton = {
            let b = UIButton(frame: CGRect(x: backgroundNavigationOnTop.frame.width - SizeHelper.widthAsWidthScreen(value: 150) - 10, y: 10, width: SizeHelper.widthAsWidthScreen(value: 150), height: backgroundNavigationOnTop.frame.height - 20))
            b.setTitle("Save", for: UIControlState.normal)
            b.layer.borderWidth = 1
            b.layer.borderColor = UIColor.black.cgColor
            b.titleLabel!.font = UIFont(name: b.titleLabel!.font.fontName, size: (backgroundNavigationOnTop.frame.height - 20)/2)
            return b
        }()
        backgroundNavigationOnTop.addSubview(buttonSave)
        
        // Setup views for customer'infomation view
        let backgroundInfoCustomer:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 100), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 287)))
            return v
        }()
        addSubview(backgroundInfoCustomer)
        
        let avatarUser:UIImageView = {
            let i = UIImageView(frame: CGRect(x: 0, y: 0, width: backgroundInfoCustomer.frame.width / 3, height: backgroundInfoCustomer.frame.width / 3))
            i.image = UIImage(named: "test")
            i.layer.cornerRadius = (backgroundInfoCustomer.frame.width / 4)/2
            i.contentMode = .center
            return i
        }()
        backgroundInfoCustomer.addSubview(avatarUser)
        
        let nameStaff:UILabel = {
            let l = UILabel(frame: CGRect(x: backgroundInfoCustomer.frame.width / 3 + 20, y: 0, width: 2*backgroundInfoCustomer.frame.width/3 - 20, height: backgroundInfoCustomer.frame.height/3))
                l.font = UIFont.boldSystemFont(ofSize: backgroundInfoCustomer.frame.height/10)
                l.textColor = UIColor.black
                l.text = "Wendy Dang"
            return l
        }()
        backgroundInfoCustomer.addSubview(nameStaff)
        
        let lineFirst:UIView = {
            let v = UIView(frame: CGRect(x: backgroundInfoCustomer.frame.width / 3, y: backgroundInfoCustomer.frame.height/3 - 1, width: 2*backgroundInfoCustomer.frame.width/3, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        backgroundInfoCustomer.addSubview(lineFirst)
        
        let date:UILabel = {
            let l = UILabel(frame: CGRect(x: backgroundInfoCustomer.frame.width / 3 + 20, y: backgroundInfoCustomer.frame.height/3, width: 2*backgroundInfoCustomer.frame.width/3 - 20, height: backgroundInfoCustomer.frame.height/3))
            l.font = UIFont(name: l.font.fontName, size: backgroundInfoCustomer.frame.height/12)
            l.textColor = UIColor.black
            l.text = "Sep 9,2016"
            return l
        }()
        backgroundInfoCustomer.addSubview(date)
        
        let lineSecond:UIView = {
            let v = UIView(frame: CGRect(x: backgroundInfoCustomer.frame.width / 3, y: 2*backgroundInfoCustomer.frame.height/3 - 1, width: 2*backgroundInfoCustomer.frame.width/3, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        backgroundInfoCustomer.addSubview(lineSecond)
        
        let duration:UILabel = {
            let l = UILabel(frame: CGRect(x: backgroundInfoCustomer.frame.width / 3 + 20, y: 2*backgroundInfoCustomer.frame.height/3, width: 2*backgroundInfoCustomer.frame.width/3 - 20, height: backgroundInfoCustomer.frame.height/3))
            l.font = UIFont(name: l.font.fontName, size: backgroundInfoCustomer.frame.height/12)
            l.textColor = UIColor.black
            l.text = "10:15 - 10:45"
            return l
        }()
        backgroundInfoCustomer.addSubview(duration)
        
        // Setup views for appointment'status
        let backgroundStatusAppointment:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 387), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 140)))
            return v
        }()
        addSubview(backgroundStatusAppointment)
        
        let lineUp:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: backgroundStatusAppointment.frame.width, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        backgroundStatusAppointment.addSubview(lineUp)
        
        var itemStatusOfAppoiontment:ItemStatusOfAppointment?
        let titles = ["Confirmed","Completed","No show","Cancel Appt"]
        for index in 0...3 {
            itemStatusOfAppoiontment = ItemStatusOfAppointment(frame: CGRect(x: CGFloat(index)*(backgroundStatusAppointment.frame.width - 3)/4, y: 0, width: (backgroundStatusAppointment.frame.width - 3)/4, height: backgroundStatusAppointment.frame.height))
            itemStatusOfAppoiontment?.setupData(isShow: false, title: titles[index])
            backgroundStatusAppointment.addSubview(itemStatusOfAppoiontment!)
            if index != 3 {
                let lineVertical:UIView = {
                    let v = UIView(frame: CGRect(x: itemStatusOfAppoiontment!.frame.origin.x + itemStatusOfAppoiontment!.frame.width, y: 1, width: 1, height: backgroundStatusAppointment.frame.height - 2))
                    v.backgroundColor = UIColor.gray
                    return v
                }()
                backgroundStatusAppointment.addSubview(lineVertical)
            }
        }
        
        let lineBottom:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: backgroundStatusAppointment.frame.height - 1, width: backgroundStatusAppointment.frame.width, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        backgroundStatusAppointment.addSubview(lineBottom)
        
        //Setup views for price of appointment
        let backgroundPriceAppointment:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 527), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 143)))
            v.backgroundColor = UIColor.gray
            return v
        }()
        addSubview(backgroundPriceAppointment)
        
        let nameService:UILabel = {
            let l = UILabel(frame: CGRect(x: 0, y: 4*backgroundPriceAppointment.frame.height/15, width: backgroundPriceAppointment.frame.width/2, height: backgroundPriceAppointment.frame.height/5))
            l.text = "Classical Manicures"
            l.textAlignment = .center
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
        }()
        backgroundPriceAppointment.addSubview(nameService)
        
        let nameCustomer:UILabel = {
            let l = UILabel(frame: CGRect(x: 0, y: 9*backgroundPriceAppointment.frame.height/15, width: backgroundPriceAppointment.frame.width/2, height: backgroundPriceAppointment.frame.height/5))
            l.text = "Linda Vo"
            l.textAlignment = .center
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
        }()
        backgroundPriceAppointment.addSubview(nameCustomer)
        
        let valuePride:UILabel = {
            let l = UILabel(frame: CGRect(x: 3*backgroundPriceAppointment.frame.width/4, y: 4*backgroundPriceAppointment.frame.height/15, width: backgroundPriceAppointment.frame.width/4, height: backgroundPriceAppointment.frame.height/5))
            l.text = "$30"
            l.textAlignment = .center
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
        }()
        backgroundPriceAppointment.addSubview(valuePride)
        
        // Setup other views
        let addOtherService:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 680), width: frame.width - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            l.text = "+Add Another Service"
            l.textAlignment = .left
            l.textColor = UIColor.red
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l

        }()
        addSubview(addOtherService)
        
        let lineVerticalFirst:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 800), width: backgroundStatusAppointment.frame.width - 10, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        addSubview(lineVerticalFirst)

        
        let addAProduct:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 800), width: frame.width - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            l.text = "+Add A Product"
            l.textAlignment = .left
            l.textColor = UIColor.red
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
            
        }()
        addSubview(addAProduct)
        
        let lineVerticalSecond:UIView = {
            let v = UIView(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 920), width: backgroundStatusAppointment.frame.width - 10, height: 1))
            v.backgroundColor = UIColor.gray
            return v
        }()
        addSubview(lineVerticalSecond)
        
        let dateCreate:UILabel = {
            let l = UILabel(frame: CGRect(x: 10, y: SizeHelper.heightAsHeightScreen(value: 920), width: frame.width/2 - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            l.text = "Date created"
            l.textAlignment = .left
            l.textColor = UIColor.gray
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
            
        }()
        addSubview(dateCreate)
        
        let valueDate:UILabel = {
            let l = UILabel(frame: CGRect(x: frame.width/2, y: SizeHelper.heightAsHeightScreen(value: 920), width: frame.width/2 - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            l.text = "Sep 7, 2016"
            l.textAlignment = .right
            l.textColor = UIColor.gray
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
            
        }()
        addSubview(valueDate)
        
        let buttonCheckOut:UIButton = {
            let b = UIButton(frame: CGRect(x: 5, y: SizeHelper.heightAsHeightScreen(value: 1040), width: frame.width - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            b.setTitle("Checkout", for: UIControlState.normal)
            b.layer.cornerRadius = 5
            b.backgroundColor = UIColor.blue
            b.titleLabel!.font = UIFont(name: b.titleLabel!.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 40))
            b.addTarget(self, action: #selector(DetailAppointmentView.checkoutClicked), for: UIControlEvents.touchUpInside)
            b.isUserInteractionEnabled = true
            return b
        }()
        addSubview(buttonCheckOut)
    }
    
    func checkoutClicked(){
        delegate?.checkoutClicked()
    }
}

protocol DetailAppointmentViewDelegate:class{
    func checkoutClicked()
}

class ItemStatusOfAppointment:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(isShow: Bool, title:String){
        self.title!.text = title
    }
    
    var iconStatus:UIImageView?
    var title:UILabel?
    func setupViews(){
        iconStatus = {
            let i = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.height, height: 2*frame.height/3))
            return i
        }()
        addSubview(iconStatus!)
        
        title = {
            let l = UILabel(frame: CGRect(x: 0, y: 2*frame.height/3, width: frame.width, height: frame.height/3))
            l.textAlignment = .center
            l.textColor = UIColor.blue
            l.font = UIFont(name: l.font.fontName, size: frame.height/6)
            return l
        }()
        addSubview(title!)
    }
}

























