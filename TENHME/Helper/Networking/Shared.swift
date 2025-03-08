//
//  Shared.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

struct Shared {
    
    //MARK:- singleton
    static var share = Shared()
    
    private init() { }
    
//    static var MG           : MG.Response?
//
//    // Change Lanuage
//    static var language                 : LanguageCode = .English {
//        didSet{
//            JSONLocalizedManager.language = Shared.language
//        }
//    }
//    static var jsonLocalized = JSONLocalizedManager.shared.getJSONLolalized()
//    
//    // Yuth: 13/12/2023
//    // Set Khmer Font Title On NavigationBar
//    func getLocalizedFont(isNav: Bool) -> String {
//        var fontName = "Inter"
//        if MyDefaults.get(key: .appLang) as? String == "km" {
//            if isNav {
//                fontName = "Hanuman-Bold"
//            } else {
//                fontName = "Hanuman-Regular"
//            }
//        } else {
//            if isNav {
//                fontName = "Inter-Bold"
//            } else {
//                fontName = "Inter-Regular"
//            }
//        }
//        return fontName
//    }
//    
//    // Set Khmer Font in any Labels in code
//    func setFontName(isBold: Bool) -> String {
//        var fontName = "Inter"
//        if MyDefaults.get(key: .appLang) as? String == "km" {
//            if isBold {
//                fontName = "Hanuman-Bold"
//            } else {
//                fontName = "Hanuman-Regular"
//            }
//        } else {
//            if isBold {
//                fontName = "Inter-Bold"
//            } else {
//                fontName = "Inter-Regular"
//            }
//        }
//        return fontName
//    }
//    
//    // Show only
//    func setSemiBoldEng(isBold: Bool) -> String {
//        var fontName = "Inter"
//        if isBold {
//            fontName = "Inter-SemiBold"
//        } else {
//            fontName = "Inter-Regular"
//        }
//        
//        return fontName
//    }
//    func setMediumEng(isMedium: Bool) -> String {
//        var fontName = "Inter"
//            if isMedium {
//                fontName = "Inter-Medium"
//            } else {
//                fontName = "Inter-Regular"
//            }
//        return fontName
//    }
//    
//    func setSemiBold(isBold: Bool) -> String {
//        var fontName = "Inter"
//        if MyDefaults.get(key: .appLang) as? String == "km" {
//            if isBold {
//                fontName = "Hanuman-Bold"
//            } else {
//                fontName = "Hanuman-Regular"
//            }
//        } else {
//            if isBold {
//                fontName = "Inter-SemiBold"
//            } else {
//                fontName = "Inter-Regular"
//            }
//        }
//        return fontName
//    }
//    
//    var checkTelegramBotURL: String {
//        if Shared.share.isProduction {
//            // Production
//            return "https://t.me/webill365_bot?start="
//        } else {
//            // UAT / Dev Test
//            return "https://t.me/webill365_uat_bot?start="
//        }
//    }
//    
//    func setMedium(isMedium: Bool) -> String {
//        var fontName = "Inter"
//        if MyDefaults.get(key: .appLang) as? String == "km" {
//            if isMedium {
//                fontName = "Hanuman-Regular"
//            } else {
//                fontName = "Hanuman-Regular"
//            }
//        } else {
//            if isMedium {
//                fontName = "Inter-Medium"
//            } else {
//                fontName = "Inter-Regular"
//            }
//        }
//        return fontName
//    }
//    //OTP
//    var strDuration              = ""
//    var crtcNumber               : [String] = []
//    
//    var isPayer             : Bool = false
//    
//    var jSessionId          : String?
//    var access_token_type   : String?
//    var access_token        : String?
//  
//    var saveBiller_id       : Int?
//    
//    var saveFaceID          : Bool?
//    
//    var loginData           : LoginModel.Response?
//    
//    var isVerifyPIN = false
//
//    var saveUsername        : String?
//    var savePassword        : String?
//    var saveOriginalUserPassword : String?
//    
//    //Yuth: 03/11/2023
//    static var sessionId    : String?
//    static var phoneNumber  : String?
//    static var passwordPIn  : String?
//    
//    var barTintColor        = UIColor.base
//    
//    var policy_url          : String?
//    var term_url            : String?
//    var customer_support    : String?
//    var baseUrl             : String?
//    var secret_key_from_Mg           : String?
//    var bill_url            : String?
//    
//    //PERMISSION CHECK
//    var permissionBilling   : [String]?
//    var permissionQuickBill : [String]?
//    var permissionCustomer  : [String]?
//    var permissionPayment    : [String]?
//    
//    
//    var isCreateGroup    : Bool?
//    var nameGroup           : String?
//    var groupNameCompletion: ((String) -> Void)?
////    var device_token        = "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiI4NTU5ODk4OTg5OCIsInNjb3BlIjoiQklMTEVSIiwiaXNzIjoiVVNFUi1QUk9WSURFUiIsIm5hbWUiOiI4NTU5ODk4OTg5OCIsImV4cCI6MTcxMTE3MDYzMiwiaWF0IjoxNzExMTYzNDMyfQ.Po8WwE3gJl_vdLyYy4o1hpCq1EGklHvDWHuJ4BQj7_73U8uXJn_Yr_UNbs9qeb9wxoutpu53os6KZzOxaQNenhho-wBs-p6XgcVUps3sLKdkZy-NThUKcwIGczhNeV4VxtG4PGnpJP-9oFHeFUf649v84wFIhJy6sVzuk5sUpShu78duHNEgHpuTZyc6JHiFWTGv4aRgQ86SByANWjvLine1dkDDLlgFPNwO1SCzeyMVm9-bOuhWGZyEIqDgzk6W8qwU_nNLSe_B8sOChBdgCutinYMIEgZjuxdKjIUB57Qe4W6NnTaA4KzsNP7WuNjn4VccD4Fi7qY5r9yQ2pOVIg"
//    var device_token        = ""
//    
//    var profileData         : ProfileModel.Response?
//    var profileDataPayer    : GetProfilePayerModel.Response?
//    var companyInfo         : CompanyInfoModel.Response?
//    
//    var errorConnectionCode = 0
//    
//    var height1 :CGFloat = 500
//    
//    //Yuth | 14/12/203
//    var subscribe_Status : Bool = false
//    
//    // Check key server
//    var isDevelopment: Bool = false // true = dev, false UAT
//    var isProduction: Bool =  false  // true production, else both on top
//    
//    
//    static var safeAreaBottom : CGFloat {
//        let root = UIApplication.shared.keyWindow?.rootViewController
//        
//        var safeAreaBottom  : CGFloat = 0.0
//        
//        if #available(iOS 11.0, *) {
//            safeAreaBottom  = root?.view.safeAreaInsets.bottom ?? 0.0
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        return safeAreaBottom
//    }
//    
//    static func getCurrentDate(date:Date) ->(dateString: String, serverDate: String, serverTime: String,onlyDate : String, date: String){
//        let calendar = Calendar.current
//        let component = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//        
//        let month   = String(format: "%02d", component.month!)
//        let day     = String(format: "%02d", component.day!)
//        let hour    = String(format: "%02d", component.hour!)
//        let minute  = String(format: "%02d", component.minute!)
//        let second  = String(format: "%02d", component.second!)
//        
//        var dateString = "\(component.year!)년 \(month)월 \(day)일 \(hour):\(minute)"
//        var date       = "\(component.year!)년 \(month)월"
//        var onlyDate   = "\(day) 일"
//        
//        switch Shared.language.rawValue {
//        case "en":
//            dateString = "\(month.generateDate(format: "MM", getType:"month"))\(" ")\(day)\(" ")\(component.year!)\(" ")\(hour):\(minute)"
//            date       = "\(month.generateDate(format: "MM", getType:"month"))\(component.year!)"
//            onlyDate = "\(day) \("days ")"
//            
//        case "km":
//            dateString = "\(component.year!)ឆ្នាំ \(month)ខែ \(day)ថ្ងៃ \(hour):\(minute)"
//            date       = "\(component.year!)ឆ្នាំ \(month)ខែ"
//            onlyDate = "\(day) 日"
//        case "ko":
//            dateString = "\(component.year!)년 \(month)월 \(day)일 \(hour):\(minute)"
//            date       = "\(component.year!)년 \(month)월"
//            onlyDate   = "\(day) 일"
//        default:
//            break
//        }
//        
//        let serverString = "\(component.year!)\(month)\(day)"
//        let serverTime = "\(hour)\(minute)\(second)"
//        return (dateString, serverString, serverTime,onlyDate, date)
//    }

}
