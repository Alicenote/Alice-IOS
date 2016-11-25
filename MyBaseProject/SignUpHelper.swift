//
//  SignUpHelper.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import Foundation
import Alamofire

class SignUpHelper:NSObject {
    static let sharedInstance = SignUpHelper()
    typealias Result = (_ isError:Bool, _ message:String, _ token:String, _ id:String) -> Void
    func registerAccount(registerModel: RegisterModel, result: @escaping Result){
        let bodyData = "email=\(registerModel.email!)&first_name=\(registerModel.first_name!)&last_name=\(registerModel.last_name!)&gender=\(registerModel.gender!)&telephone=\(registerModel.telephone!)&password_hash=\(registerModel.password_hash!)"
        
        ApiService.sharedInstance.requestWithPost(url: "http://api.alicenote.com/v1/users/register", bodyData: bodyData, completionHandler: {(data) -> Void in
            if data.count != 0 {
                do {
                    if let parsedData = try? JSONSerialization.jsonObject(with: data as Data) as! [String:Any] {
                        if let code = parsedData["status"] as? Int {
                            guard let token = parsedData["token"] as? String else{
                                if let message = parsedData["errors"] as? String {
                                    result(true,message,"","")
                                }else {
                                    result(true,"Please check your connection!","","")
                                }
                                return
                            }
                            guard let id = parsedData["id"] as? String else{
                                if let message = parsedData["errors"] as? String {
                                    result(true,message,"","")
                                }else {
                                    result(true,"Please check your connection!","","")
                                }
                                return
                            }
                            switch code {
                            case 101:
                                if let message = parsedData["errors"] as? String {
                                    result(true,message,"","")
                                }else {
                                    result(true,"Please check your connection!","","")
                                }
                                break
                            default:
                                result(false,"",token,id)
                                break
                            }
                        }
                        else {
                            result(true,"Please check your connection!","","")
                        }
                    }
                } catch {
                    result(true,"Please check your connection!","","")
                }
            }else {
                result(true,"Please check your connection!","","")
            }
        })
    }
    
    func loginAccount(signInModel:SignInModel, result: @escaping Result){
        let bodyData = "email=\(signInModel.email!)&password_hash=\(signInModel.password)"
        ApiService.sharedInstance.requestWithPost(url: "http://api.alicenote.com/v1/users/login", bodyData: bodyData, completionHandler: { (data) -> Void in
            do {
                if let parsedData = try? JSONSerialization.jsonObject(with: data as Data) as! [String:Any] {
                    if let code = parsedData["status"] as? Int {
                        guard let token = parsedData["token"] as? String else{
                            if let message = parsedData["errors"] as? String {
                                result(true,message,"","")
                            }else {
                                result(true,"Please check your connection!","","")
                            }
                            return
                        }
                        guard let id = parsedData["id"] as? String else{
                            if let message = parsedData["errors"] as? String {
                                result(true,message,"","")
                            }else {
                                result(true,"Please check your connection!","","")
                            }
                            return
                        }
                        switch code {
                        case 100:
                            if let message = parsedData["errors"] as? String {
                                result(true,message,"","")
                            }else {
                                result(true,"Please check your connection!","","")
                            }
                            break
                        default:
                            result(false,"",token,id)
                            break
                        }
                    }
                    else {
                        result(true,"Please check your connection!","","")
                    }
                }
            } catch {
                
                result(true,"Please check your connection!","","")
            }

        })
    }
    
    func registerShop(shopModel: ShopModel,result :@escaping Result){
        
        let urlString = "http://api.alicenote.com/v1/welcomes/set-setup?salon_id=89"
        
        let baseInfoShop = shopModel.baseInfoShop
        let baseScheduleShop = shopModel.baseScheduleShop
        let baseServiceShop = shopModel.baseServiceShop
        
        let scheduleParameter = [[
            "day" : baseScheduleShop?.day ,
            "nameday" : baseScheduleShop?.nameDay ,
            "openhour" : baseScheduleShop?.openHour ,
            "closehour" : baseScheduleShop?.closeHour ,
            "status" : baseScheduleShop?.status
        ]]
        
        let servicesOfService = [[
            "name" : baseServiceShop?.baseServicesOfServiceShop?.name,
            "check" : baseServiceShop?.baseServicesOfServiceShop?.check,
            "price" : baseServiceShop?.baseServicesOfServiceShop?.price as Any,
            "duaration" : baseServiceShop?.baseServicesOfServiceShop?.duaration as Any,
            "work" : baseServiceShop?.baseServicesOfServiceShop?.work as Any
        ]]
        
        let service = [[
            "group" : [
                "id" : baseServiceShop?.baseGroupOfServiceShop?.id,
                "name" : baseServiceShop?.baseGroupOfServiceShop?.name
            ],
            "services" :  servicesOfService
        ]]
        
        let parameter : Parameters = [
            "info" :  [
                "business_name" : baseInfoShop?.nameShop,
                "business_type" : baseInfoShop?.bussinessType,
                "state_id" : baseInfoShop?.stateId,
                "city" : baseInfoShop?.city,
                "postcode" : baseInfoShop?.postcode ,
                "address" : baseInfoShop?.address
            ],
            "schedule" :  scheduleParameter,
            "service" : service
        ]
        
        let request = Alamofire.request(urlString, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            if let error = response.result.error  {
                result(true,"Please check your connection!","","")
            }
            if let json = response.result.value {
                result(false,"","","")
            } else {
                result(true,"Please check your connection!","","")
            }
            
        }

    }
    
    func getRegisterShopForm(shopId: String){
        
    }

}
