//
//  CheckoutAppiontmentView.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/18/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class CheckoutAppointmentView:UIView {
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
        
        let valueTotal:UILabel = {
            let l = UILabel(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 100), width: SizeHelper.widthAsWidthScreen(value: 200), height: SizeHelper.heightAsHeightScreen(value: 125)))
            l.textColor = UIColor.black
            l.font = UIFont.boldSystemFont(ofSize: SizeHelper.heightAsHeightScreen(value: 40))
            l.text = "Total\n$30"
            l.textAlignment = .center
            l.numberOfLines = 2
            return l
        }()
        addSubview(valueTotal)
        
        addSubview({
            let v = UIView(frame: CGRect(x:SizeHelper.widthAsWidthScreen(value: 200), y: SizeHelper.heightAsHeightScreen(value: 100), width: 1 , height: SizeHelper.heightAsHeightScreen(value: 125)))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 225), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 325), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        //Setup views for price of appointment
        let backgroundPriceAppointment:UIView = {
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 325), width: frame.width, height: SizeHelper.heightAsHeightScreen(value: 125)))
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
        
        let namePride:UILabel = {
            let l = UILabel(frame: CGRect(x: 3*backgroundPriceAppointment.frame.width/4, y: 4*backgroundPriceAppointment.frame.height/15, width: backgroundPriceAppointment.frame.width/4, height: backgroundPriceAppointment.frame.height/5))
            l.text = "$30"
            l.textAlignment = .center
            l.textColor = UIColor.black
            l.font = UIFont(name: l.font.fontName, size: backgroundPriceAppointment.frame.height/5)
            return l
        }()
        backgroundPriceAppointment.addSubview(namePride)
        
        addSubview({
            let v = UIView(frame: CGRect(x: 0, y: SizeHelper.heightAsHeightScreen(value: 450), width: frame.width, height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )

        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 550), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 650), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        let dateCreate:UILabel = {
            let l = UILabel(frame: CGRect(x: 50, y: SizeHelper.heightAsHeightScreen(value: 650), width: frame.width - 50, height: SizeHelper.heightAsHeightScreen(value: 100)))
            l.text = "Date created"
            l.textAlignment = .left
            l.textColor = UIColor.gray
            l.font = UIFont(name: l.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 30))
            return l
            
        }()
        addSubview(dateCreate)
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 750), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 850), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        addSubview({
            let v = UIView(frame: CGRect(x:0, y: SizeHelper.heightAsHeightScreen(value: 950), width: frame.width , height: 1))
            v.backgroundColor = UIColor.gray
            return v
            }()
        )
        
        // Setup other views
        let buttonCheckOut:UIButton = {
            let b = UIButton(frame: CGRect(x: 5, y: SizeHelper.heightAsHeightScreen(value: 1040), width: frame.width - 10, height: SizeHelper.heightAsHeightScreen(value: 120)))
            b.setTitle("Save Checkout", for: UIControlState.normal)
            b.titleLabel!.font = UIFont(name: b.titleLabel!.font.fontName, size: SizeHelper.heightAsHeightScreen(value: 40))
            b.layer.cornerRadius = 5
            b.backgroundColor = UIColor.blue
            return b
        }()
        addSubview(buttonCheckOut)
    }
}
