//
//  Constant.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

typealias Completion                = ()                -> Void
typealias Completion_ScreenShotView = (UIView)             -> Void
typealias Completion_Bool           = (Bool)            -> Void
typealias Completion_NSError        = (NSError?)        -> Void
typealias Completion_String_Bool    = (String,Bool)          -> Void
typealias Completion_Bool_Bool      = (Bool,Bool,Bool,Bool, Bool)        -> Void
typealias Completion_String_String  = (String, String)  -> Void
typealias Completion_Int_String     = (Int, String)     -> Void
typealias Completion_String_Error   = (String, Error?)  -> Void
//typealias CompletionArr   = ([QrinfoModel.Response.DataObject.Qr_Collection])  -> Void
typealias Completion_String_String_String  = (String, String, String)  -> Void
typealias Completion_Int            = (Int)     -> Void
typealias Completion_String            = (String)     -> Void
typealias Completion_Bool_Bool_Bool      = (Bool,Bool,Bool)        -> Void
typealias CompletionDidFromCalender = (() -> Void)
typealias CompletionDidToCalender   = (() -> Void)
typealias CompletionGotoBillDetail  = (() -> Void)
typealias CompletionButton          = (() -> Void)


enum HTTPMethod : String {
    case GET    = "GET"
    case POST   = "POST"
    case PUT    = "PUT"
    case PATCH  = "PATCH"
    case DELETE = "DELETE"
}

enum XAppVersion : String {
   case base = "20210705"
   case appType = "iOS"
}


enum NotifyKey : String {
    case reloadLocalize     = "reloadLocalize"
    case showHideNavBar     = "showHideNavBar"
    case isQuickBills       = "isQuickBills"
    case reloadQR             = "reloadQR"
    case updateCustomer     = "updateCustomer"
    case reloadSetting     = "reloadSetting"
    case reloadPaymentLink  = "reloadPaymentLinks"
    case deletePaymentLink  = "deletePaymentLinks"
    case savePinPasscode    = "savePinPasscode"
    
    func getNotifyKey() -> String {
        return "\(self.rawValue)"
    }
}

//enum APIKey: String {
    
 //   static var baseURL : String = "https://api.publicapis.org/"
    
//    static var AppSettingURL : String {
//        #if DEBUG
//        
//        if Shared.share.isProduction{ // ONLY Production
//            return "https://mg.wecambodia.com/"
//        }else{ // UAT and Development
//            return "https://mg.kosign.dev/"
//        }
//       
//        #else
//        return "https://mg.wecambodia.com/"
//        #endif
//    }
//    
//    static var AppID : String {
//        #if DEBUG
//        if Shared.share.isProduction{ // ONLY Production
//            return "c5006ec6-b37e-4d60-bf96-d1093c83e2b6"
//        }else{
//            return "20e4d928-1b7f-4ba1-8bb5-45c0f6c8a5f2"
//        }
//     
//        #else
//        return "c5006ec6-b37e-4d60-bf96-d1093c83e2b6"
//        #endif
//    }
//    
////    static var baseURL : String {
////        #if DEBUG
////        return "https://webill-ppcb-api.kosign.dev/"
////        #else
////        return "https://ppcb-api.webill365.com/"
////        #endif
////    }
//    #if DEBUG
//    case mg                         = "https://mg.kosign.dev/api/v2/app/setting/20e4d928-1b7f-4ba1-8bb5-45c0f6c8a5f2?os=iOS"
//    #else
//    case mg                         = "api/v2/app/setting/20e4d928-1b7f-4ba1-8bb5-45c0f6c8a5f2?os=iOS"
//    #endif
//    
//    
//    case AppSetting             = "api/v2/app/setting/"
//    case logIn                  = "api/wb/v1/auth/login"    // POST
//                
//    case signUp                 = "/api/wb/v1/auth/signup"
//    
//    // 17.11.2023
//    case invoiceNo              = "api/wb/v1/bills/last-invoice-no"
//                
//    //MARK: OPT
////    case sendOTP                = "/api/wb/v1/otps/send"
//                
////    case verifyOTP              = "/api/wb/v1/otps/verify"
//                
//    //MARK: Customer
//    case getCreatePayer         = "api/wb/v1/payers" // Get & Create payer
//    case getSearchPayer         = "api/wb/v1/payers?"
//        
//    // getPayerInfo & Delete
//    case getPayerInfo             = ""
//        
//    case updatePayerInfo        = "api/wb/v1/payers/{payer_id}/information"
//        
//    case updatePayerNimithAc    = "/api/wb/v1/payers/{payer_id}/nimith-account"
//    
////    case deletePayer          = "/api/wb/v1/payers/{payer_id}"
//    
//    //MARK: Billing
//    // GET & POST Bill
//    case getBill                = "api/wb/v1/bills"
//        
//    case getBillInfo            = "api/wb/v1/bills/"
//    
//    case getBill_Installment    = "/api/wb/v1/bills/{bill_id}/installment"
//    
//    // UPDATE & DELETE Bill
//    case updateDeleteBillInfo         = "/api/wb/v1/bills/"
////    case deleteBill             = "/api/wb/v1/bills/{bill_id}"
//    
//    //MARK: Payment
//    case getPayment             = "api/wb/v1/payments"
//    
//    case getPaymentInfo         = "api/wb/v1/payments/"     // Use Transaction Id the last ==> "api/wb/v1/payments/51"
//    
//    //MARK: - Payment Links : 11.10.2024
//    case getPaymentLinks        = "/api/wb/v1/qr-collections" // get payment links list
//    case getQRCollectionInfo    = "/api/wb/v1/qr-collections/{qr_id}/information"
//    case updateQRCollection     = "/api/wb/v1/qr-collections/{account_no}"
//    case acitvateQRCollection   = "/api/wb/v1/qr-collections/activate"
//    case deacitvateQRCollection = "/api/wb/v1/qr-collections/deactivate"
//    case deleteQRCollection     = "api/wb/v1/qr-collections"
//    case approveQRCollection    = "/api/wb/v1/qr-collections/{account_no}/approve"
//    case rejectQRCollection     = "/api/wb/v1/qr-collections/{account_no}/reject"
//    case getGroupPaymentLinks   = "/api/wb/v1/qr-groups"
//    case getPaymentQRInfo       = "/api/wb/v1/qr-collections/{qr_id}/payments"
//    
//    
//    //MARK: Profile
//    // GET & UPDATE Profile
//    case getProfile             = "api/wb/v1/profile/my-account"
////    case updateProfile          = "/api/wb/v1/profile/my-account"
//    
//    case deleteAccount          = "api/wb/v1/profile"
//    
//    // GET & UPDATE Company Info
//    case getCompanyInfo         = "api/wb/v1/profile/company-info"
////    case updateCompanyInfo      = "/api/wb/v1/profile/company-info"
//    
//    case changePassword         = "/api/wb/v1/profile/change-password"
//    
//    case getFee                 = "api/wb/v1/profile/contract"
//    
//    case getCustomer            = "api/wb/v1/bill/payers"
//    
//    //MARK: New Update ===> 19.10.2023 (Payer)
//    case sendOTP                = "api/wbi/mb/payer/v1/otps/send"   // SEND OTP
//    
//    case verifyOTP              = "api/wbi/mb/payer/v1/otps/verify" // VERIFY OTP
//    
//    //MARK: New Update ===> 27.12.2023 (Biller)
//    case sendOTPSignUp          = "api/wb/v1/otp/send"   // SEND OTP
//    
//    case verifyOTPSignUp        = "api/wb/v1/otp/verify" // VERIFY OTP
//    
//    case loginPayer             = "api/wbi/mb/payer/v1/auth/login"
//    
//    case getProfilePayer        = "api/wbi/mb/payer/v1/profile"
//    
//    case checkPhoneNumber       = "api/wbi/mb/payer/v1/auth/phonenumber/check"
//    
//    case sendOTPResetPW = "api/wb/v1/otp/send-reset"
//    
//    case getBillPayer           = "api/wbi/mb/payer/v1/billings"
//    
//    case resetPinCode           = "api/wbi/mb/payer/v1/auth/reset-password"
//    
//    case deepLink               = "api/wbi/mb/payer/v1/billings/deep-link"
//    
//    //MARK: New Update ===> 01/12/2023 (Biller)
//    
//    case quickBills             = "api/wb/v1/quick-bills" // GET/POST
//    
//    case getParentAccount       = "api/wb/v1/profile/parent-accounts"
//    
//    
//    // MARK: New Update ==> 13/12/2023
//    
//    case subscribePlan          = "api/wb/v1/service-plans/subscribe"
//    
//    case getServicePlan         = "api/wb/v1/service-plans"
//    
//    case checkParentAccount     = "api/wb/v1/service-plans/check-parent-account/"
//    
//    //MARK: - New Update ==> 20/03/2024
//    case groupCount             = "api/wb/v1/groups/count"
////    case getbillinfo = "/api/wb/v1/bills/{bill_detail_id}/information    "
//    
//    
//    // MARK: New Update Customer and QR Collection
//    
//    case qrCollectionInfo       = "api/wb/v1/payers/{payer_id}/qr-collection"
//    // MARK:  - create Group
//    case  getAndCreateGroup             = "api/wb/v1/groups"
//    case  deleteGroup                   = "/api/wb/v1/groups/{group_id}"
//    case  getGroupCount                 = "/api/wb/v1/groups/count"
//    
//    // MARK: - Customer
////    case getPayer                       = "/api/wb/v1/payers"
////    case createAndDeletePayer             = "api/wb/v1/payers"
//    // updaload image
//    case uploadPayer                      = "/api/wb/v1/bill/payers/upload"
//    case getPayerbyPhoneNumber            = "/api/wb/v1/bill/payers/{phonenumber}/phonenumber"
//    case uploadImage                      = "api/wb/v1/files/upload-image"
////    case updatePayerInfo                = "/api/wb/v1/payers/{payer_id}/information"
//    
//    //MARK: - Permission
//    case getPermission                    = "api/wb/v1/employees/permissions"
//    
//    //MARK: - 19/06/2024
//    case resetPassword  = "api/wb/v1/auth/reset-password"
//    
//    //MARK: - 23/07/2024
//    case e_filling = "/api/wb/v1/settings/e-fillings"
//}
