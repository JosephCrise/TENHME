//
//  DataAccess.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

class DataAccess {
    
    public static var sharedInstance    = DataAccess()
    
    // The Network access for request, response, upload and download task
    private static var sessionConfig    : URLSessionConfiguration!
    private static var session          : URLSession!
    
    
    ///::  SESSION TIMEOUT
    var timeOutDuration: TimeInterval      = 600 // = 10 minutes , 1 timeOutDuration = 1 second.
    private static var timer            : Timer?
    var session_timeout = false
    var indicatorTimer  : Timer?
    var runCount        = 0
//    let signInVC    = SignInVC()
    
    
    
    
    
    
    static var shared : DataAccess = {
        // Timeout Configuration
        sessionConfig                               = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest     = 120.0
        sessionConfig.timeoutIntervalForResource    = 120.0
        session = URLSession(configuration: sessionConfig)
        return sharedInstance
    }()
    
    private func multiUploadBody(images: [UIImage], boundary: String) throws -> Data {
        
        var body = Data()
        
        images.forEach { (image) in
            
            body.append(Data("--\(boundary)\r\n".utf8))
            body.append(Data("Content-Disposition: form-data; name=\"file_data\"; filename=\"test1.jpeg\";\r\n".utf8))
            body.append(Data("Content-Type: image/*\r\n".utf8))
        
            body.append(image.jpegData(compressionQuality: 1.0) ?? Data())
            body.append(Data("\r\n".utf8))
        }
        
        body.append(Data("--\(boundary)--\r\n".utf8))
        
        return body
    }
    
    
    //MARK: - PRE AUTH
    private func checkingSession() { ///:: When
        if session_timeout{
            DispatchQueue.main.async {
                self.indicatorTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)
                print("checkingSession")
            }
        }
        
    }
    //MARK: - @objc func
    @objc func updateProgressView() {
        runCount += 1
        if runCount == 5 {
            indicatorTimer?.invalidate()
        }
    }
    
    @objc private func onSessionExpired() { ///::  When session expired  ** Duration work again
        startSessionTimeout(isStart: false)
        print("onSessionExpired")
        session_timeout = true
        checkingSession()
//        preAUTH()
    }
    
    func startSessionTimeout(isStart: Bool) {
        // Session timer
        DataAccess.timer?.invalidate()
        
        if isStart {
            DataAccess.timer = Timer.scheduledTimer(timeInterval: self.timeOutDuration,
                                                    target      : self,
                                                    selector    : #selector(self.onSessionExpired),
                                                    userInfo    : nil,
                                                    repeats     : false)
        }
    }
    
    func removeUserDefaultLogin() {
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "loginEmail") != nil {
            defaults.removeObject(forKey: "loginEmail")
        }
        if defaults.object(forKey: "savePayerSessionID") != nil {
            defaults.removeObject(forKey: "savePayerSessionID")
        }
        if defaults.object(forKey: "savePayerPhonNumber") != nil {
            defaults.removeObject(forKey: "savePayerPhonNumber")
        }
        if defaults.object(forKey: "saveIsPayer") != nil {
            defaults.removeObject(forKey: "saveIsPayer")
        }
        if defaults.object(forKey: "SaveUserPasswordEncrypted") != nil {
            defaults.removeObject(forKey: "SaveUserPasswordEncrypted")
        }
        if defaults.object(forKey: "SaveOriginalUserPassword") != nil {
            defaults.removeObject(forKey: "SaveOriginalUserPassword")
        }
        
        
        defaults.synchronize()
    }
    
    
    
//    func navigateToOnboarding() {
//            guard let rootViewController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController else {
//                return
//            }
//            
//            let mainStoryboard = UIStoryboard(name: "OnBoardingSB", bundle: nil)
//            let onboardingViewController = mainStoryboard.instantiateViewController(withIdentifier: "OnBoadingVC") as! OnBoadingVC
//            
//            rootViewController.pushViewController(onboardingViewController, animated: true)
//    }
    ///:: ==> PRE AUTH <== END
    
    
//    private func multiUploadBody(images: [UIImage], boundary: String) throws -> Data {
//
//        var body = Data()
//
//        images.forEach { (image) in
//
////            body.append("--\(boundary)\r\n")
//            body.append(Data("--\(boundary)\r\n".utf8))
//            body.append("Content-Disposition: form-data; name=\"files\"; filename=\"test.jpeg\";\r\n")
//            body.append("Content-Type: image/*\r\n\r\n")
//            body.append(image.jpegData(compressionQuality: 1) ?? Data())
//            body.append("\r\n")
//        }
//
//        body.append("--\(boundary)--\r\n")
//
//        return body
//    }
    
//    func uploadMultiParts(images: [UIImage], completion: @escaping (NSDictionary, Error?) -> Void) {
//        let boundary = "\(UUID().uuidString)"
////        saveAccessToken = Shared.share.access_token ?? ""
////        saveTokenType   = Shared.share.access_token_type ?? ""
////        if let _ = Shared.share.access_token {
////
////            x
////            //            request.addValue("Bearer \(saveAccessToken) \(saveTokenType)", forHTTPHeaderField: "Authorization")
////        }
//    
////        let url = URL(string: APIKey.uploadImage.rawValue )!
//      
//       
//        
////        var saveAccessToken = UserDefaults.standard.string( forKey: "saveAccessToken")  ?? ""
////        var saveTokenType   = UserDefaults.standard.string(  forKey: "saveTokenType")    ?? ""
//        
//        
//      let saveAccessToken = Shared.share.access_token ?? ""
//      let  saveTokenType   = Shared.share.access_token_type ?? ""
//        if let _ = Shared.share.access_token {
//            
//            request.addValue("\(saveTokenType) \(saveAccessToken)", forHTTPHeaderField: "Authorization")
//        }
//        print(request.url ?? "")
////        Log.d("""
////            \(request.url!)
////            Request Body:
////            \(MyJson.prettyPrint(value: request.httpBody as AnyObject))
////            """)
//        
//        DispatchQueue.main.async {
////            LoadingView.show()
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        }
//        
//        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { [weak self] (data, response, error) in
//            // Fix iOS 13
//            guard self != nil else { return }
////            guard let `self` = self else { return }
//            
//            DispatchQueue.main.async {
////                LoadingView.hide()
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            }
//            
//            if error == nil {
//                guard let data = data else {
//                    let error  = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "No response data."])
//                    
//                    DispatchQueue.main.async {
//                        completion([:], error)
//                    }
//                    return
//                }
//
//                let dic = try? MyNotify.jsonToDic(UTF8.decodeForData(data))
//
//                if let message = dic?["message"] as? String , (dic?["status"] as? Bool) == false {
//                    
//                    DispatchQueue.main.async {
//                        completion([:], NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : message]))
//                    }
//                }
//                else{
//                    let data = dic?["data"] as? [[String: String]] ?? [[:]]
//                    
//                    DispatchQueue.main.async {
//                        completion(data[0] as NSDictionary,  nil)
//                    }
//                }
//            }
//            else{
//                DispatchQueue.main.async {
//                    completion([:], error)
//                }
//            }
//        }).resume()
//    }
    
    
    
//    private func manualError(err: NSError) -> NSError {
//        // Custom NSError
//    #if DEBUG
//        print("Connection server error : \(err.domain)")
//    #endif
//        switch err.code  {
//            
//            /**  -1001 : request timed out
//             -1003 : hostname could not be found
//             -1004 : Can't connect to host
//             -1005 : Network connection lost
//             -1009 : No internet connection
//             */
//        case -1001, -1003, -1004: // request timed out
//            let error = NSError(domain: "NSURLErrorDomain", code: err.code, userInfo: [NSLocalizedDescriptionKey : "connection_time_out".localized])
//            return error
//        case -1005 : // Network connection lost
//            let error = NSError(domain: "NSURLErrorDomain", code: err.code, userInfo: [NSLocalizedDescriptionKey : "internet_connection_is_unstable_please_try_again_after_connecting".localized])
//            return error
//        case -1009 : // No internet connection
//            let error = NSError(domain: "NSURLErrorDomain", code: err.code, userInfo: [NSLocalizedDescriptionKey : "internet_connection_is_unstable_please_try_again_after_connecting".localized])
//            Shared.share.errorConnectionCode = err.code
//            return error
//        default :
//            return err
//        }
//    }
    
    private init() {}
    
//    private func showHideLoading(isShow: Bool) {
//        DispatchQueue.main.async {
//            if isShow {
//                LoadingView.show()
//            }
//            else {
//                LoadingView.hide()
//            }
//        }
//    }
    
    // Request data task with API and response data & error as completion
//    func fetch<I: Encodable, O: Decodable>(shouldShowLoading  : Bool = true,
//                                           apiKey             : APIKey,
//                                           urlStr             : String = "",
//                                           httpMethod         : HTTPMethod = .POST,
//                                           access_token       : String = Shared.share.access_token ?? "",
//                                           body               : I,
//                                           responseType       : O.Type,
//                                           completion         : @escaping (Result<O?, NSError>) -> Void) {
//        print("access token from fetch: \(Shared.share.access_token )")
//        if shouldShowLoading {
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
//                LoadingView.show()
//                UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            }
//        }
//        
//        startSessionTimeout(isStart: true)
////        print("====> Access_Token \(access_token)")
//        
//        let request = self.getURLRequest(apiKey     : apiKey,
//                                         urlStr     : urlStr,
//                                         body       : body,
//                                         httpMethod : httpMethod)
//        
//        DataAccess.session.dataTask(with: request) { (data, response, error) in
//            
//            //ShowLoadingimagView
//            if shouldShowLoading {
//                DispatchQueue.main.asyncAfter(deadline: .now()) {
//                    LoadingView.hide()
//                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
//                }
//            }
//            
//            //MARK: - Check Data, Response Error
//            guard
//                let url = response?.url,
//                let httpResponse = response as? HTTPURLResponse,
//                let fields = httpResponse.allHeaderFields as? [String: String]
//            else {
//                
//                if let nsError = error as NSError? {
//#if DEBUG
//                    print("""
//                    \(nsError.code) | \(nsError.localizedDescription)
//                    """)
//#endif
//                    
//                } else {
//                    let nsError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "error_occurred_during_process".localized])
//#if DEBUG
//                    print("""
//                    \(nsError.code) | \(nsError.localizedDescription)
//                    """)
//                    
//                    self.manualError(err: (error as? NSError)!)
//                    
//#endif
//                }
//                return
//            }
//            
//            guard let data = data else {
//                
//                let nsError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "error_occurred_during_process".localized])
//#if DEBUG
//                print("""
//                \(nsError.code) | \(nsError.localizedDescription)
//                """)
//#endif
//                
//                return
//            }
//            
//            var decodedDataString  = String(data: data, encoding: String.Encoding.utf8)?.removingPercentEncoding
//            
//            if apiKey == .deepLink {
//                decodedDataString = String(data: data, encoding: String.Encoding.utf8) ?? ""
//            }
//            
//            
//            guard let responseData = decodedDataString == nil ? data : decodedDataString?.data(using: .utf8) else {
//                Log.e("""
//                    \(request.url!) | \(apiKey.rawValue)
//                    Could not convert string to data.
//                    """)
//                let nsError = NSError(domain: "ClientError", code: 168, userInfo: [NSLocalizedDescriptionKey : "Could not convert string to data."])
//                
//#if DEBUG
//                print("""
//                \(nsError.code) | \(nsError.localizedDescription)
//                """)
//#endif
//                return
//            }
//            
////#if DEBUG
//            Log("""
//                \(request.url!) | \(apiKey.rawValue)
//                \(responseData.prettyPrinted)
//                """)
////#endif
//            
//            
//            let responseDataDic = responseData.dataToDic
//            let errorObject = try? JSONDecoder().decode(ErrorResponse.self, from: responseData)
//            guard let responseObject = try? JSONDecoder().decode(responseType, from: responseData) else {
//                
//                if responseData.prettyPrinted == "{\n\n}" {
//                    let htmlString = String(data: responseData, encoding: .utf8) ?? ""
//                    
//#if DEBUG
//                    Log.e("""
//                            \(request.url!) | \(apiKey.rawValue)
//                            
//                                            Empty Response:
//                            \(responseData.prettyPrinted)
//                            \(htmlString)
//                            """)
//                    DispatchQueue.main.async {
////                        completion(.failure(error))
//                    }
//                    print("Service Unavailable: ",error?.localizedDescription ?? "")
//#endif
//                    DispatchQueue.main.async {
//                        completion(.success(nil))
//                    }
//                } else {
//                    // Error: Reponse Error has no key "error"
//                    
//                    if let dic = responseDataDic["error"] {
//                        let status = responseDataDic["status"] as? Int ?? 0
//                        let message = status == 0 ? dic : "[\(status)]\n\(dic)"
//                        let error = NSError(domain: "ClientError", code: 168, userInfo: [NSLocalizedDescriptionKey : message])
//                        
//                        Log.e("""
//                                                \(request.url!) | \(apiKey.rawValue)
//                                                Error mapping data.
//                                                Response:
//                                                \(responseData.prettyPrinted)
//                                                """)
//                        self.preAUTH()
//                        
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    } else if let status = responseDataDic["status"] as? [String: Any],
//                              let code = status["code"] as? Int,
//                              let message = status["message"] as? String {
//                        //yuthfight 28/11/2024: Check Unauthorized Login
//                        if message == "Unauthorized" {
//                            self.preAUTH()
//                            let error = NSError(domain: "Server Error", code: code, userInfo: [NSLocalizedDescriptionKey: message])
//                            DispatchQueue.main.async {
//                                completion(.failure(error))
//                            }
//                        } else {
//                            let error = NSError(domain: "Server Error", code: code, userInfo: [NSLocalizedDescriptionKey: message])
//                            DispatchQueue.main.async {
//                                completion(.failure(error))
//                            }
//                        }
//                    }
//                }
//                return
//            }
//            
//            // Set cookie to use with Web
//            let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
//            HTTPCookieStorage.shared.setCookies(cookies, for: url, mainDocumentURL: nil)
//            for cookie in cookies {
//                var cookieProperties        = [HTTPCookiePropertyKey: Any]()
//                cookieProperties[.name]     = cookie.name
//                cookieProperties[.value]    = cookie.value
//                cookieProperties[.domain]   = cookie.domain
//                cookieProperties[.path]     = cookie.path
//                cookieProperties[.version]  = cookie.version
//                cookieProperties[.expires]  = Date().addingTimeInterval(31536000)
//                
//                Shared.share.jSessionId     = "\(cookie.name)=\(cookie.value)"
//                
//                if let cookie = HTTPCookie(properties: cookieProperties) {
//                    HTTPCookieStorage.shared.setCookie(cookie)
//                }
//                
//#if DEBUG
//                print("name: \(cookie.name) value: \(cookie.value)")
//#endif
//            }
//            
//            //MARK: - Check ERROR:
//            if let dic = responseDataDic["error"] {
//                let status = responseDataDic["status"] as? Int ?? 0
//                let message     = status == 0 ? dic : "[\(status)]\n\(dic)"
//                let error       = NSError(domain: "ClientError", code: 168, userInfo: [NSLocalizedDescriptionKey : message])
//                let errorDic    = dic as? NSDictionary
//                
//                if let errorCode = errorDic?["code"] as? String {
//                    if errorCode == "ERP_REQUEST_TIMEOUT" {
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    }
//                    // Token and Session Expired
//                    else if errorCode == "SESSION_EXPIRED" {
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                        
//                    } else if errorCode == "ERP_SERVICE_ERROR" || errorCode == "BAD_REQUEST" {
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    }
//                    
//                    else {
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    }
//                }
//            } else {
//                if let codeError = responseDataDic["code"] as? String {
//                    let status   = responseDataDic["status"] as? Int ?? 0
//                    let message  = status == 0 ? codeError : "[\(status)]\n\(codeError)"
//                    let error    = NSError(domain: "ClientError", code: 168, userInfo: [NSLocalizedDescriptionKey : message])
//                    if codeError == "UNAUTHORIZED" {
//                        self.preAUTH()
//                        DispatchQueue.main.async {
//                            completion(.failure(error))
//                        }
//                    }
//                }
//                else {
//                    DispatchQueue.main.async {
//                        completion(.success(responseObject))
//                    }
//                }
//            }
//            
//        }.resume()
//        
//    }
    
    static func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []
        if prettyPrinted {
          options = JSONSerialization.WritingOptions.prettyPrinted
        }

        do {
          let data = try JSONSerialization.data(withJSONObject: json, options: options)
          if let string = String(data: data, encoding: String.Encoding.utf8) {
            return string
          }
        } catch {
          print(error)
        }

        return ""
    }
    
    //MARK: - GET REQUEST URL -
//    private func getURLRequest<T: Encodable>(apiKey: APIKey,
//                                             urlStr: String = "",
//                                             body: T,
//                                             httpMethod : HTTPMethod = .POST) -> URLRequest {
//        
//        func queryString<T:Encodable>(body:T) -> String {
//            let request     = body
//            guard let str   = request.asJSONString() else { return "" }
//            return str
//        }
//        
//        var url : URL!
//        
////        switch apiKey {
////        case .getSearchPayer,.getPayerInfo,.getBill,.getPaymentInfo,.getCreatePayer,.getPayment,.getPaymentLinks ,.getCustomer,.quickBills,.deepLink,.checkParentAccount,.updateDeleteBillInfo,.getBillInfo,.getBillPayer, .groupCount, .getPermission, .resetPassword:
////            
////            url = URL(string: "\(Shared.share.baseUrl ?? "")/\(apiKey.rawValue)\(urlStr)")
////            
////        case .AppSetting:
////            // MG
////            url = URL(string: "\(APIKey.AppSettingURL)\(APIKey.AppSetting.rawValue)\(APIKey.AppID)?os=iOS")
////        case .qrCollectionInfo, .getQRCollectionInfo, .deacitvateQRCollection, .acitvateQRCollection, .updateQRCollection, .getPaymentQRInfo, .rejectQRCollection, .approveQRCollection:
////            url = URL(string: "\(Shared.share.baseUrl ?? "")/\(urlStr)")
////            
////        case .e_filling:
////            url = URL(string: "\(Shared.share.baseUrl ?? "")/\(urlStr)")
////            
////        default :
////            
////            url = URL(string: "\(Shared.share.baseUrl ?? "")/\(apiKey.rawValue)")
////            
////        }
//        
//        
//        var request         = URLRequest(url: url!)
//        request.httpMethod  = httpMethod.rawValue
//        
//        let strQuery = queryString(body: body)
//        
//        if httpMethod != .GET {
//            request.httpBody = strQuery.data(using: .utf8)
//        }
//        
//        guard let cookies = HTTPCookieStorage.shared.cookies(for: request.url!) else {
//            return request
//        }
//        
//        
//        request.allHTTPHeaderFields = HTTPCookie.requestHeaderFields(with: cookies)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        request.addValue("\(XAppVersion.base.rawValue)", forHTTPHeaderField: "X-App-Version")
//        request.addValue("\(Shared.language.rawValue)", forHTTPHeaderField: "Accept-Language")
//        request.addValue("\(XAppVersion.appType.rawValue)", forHTTPHeaderField: "X-App-Type")
//        
//        var saveAccessToken = UserDefaults.standard.string( forKey: "saveAccessToken")  ?? ""
//        var saveTokenType   = UserDefaults.standard.string(  forKey: "saveTokenType")    ?? ""
//        
//        //         set Authorization = "" : using with api logout when token is empty
//        //         Set Authorization = "" when request code list. because code list doesn't need Authorization
//        //        if Shared.share.isRequestWithoutAuthorize == false {
//        //            request.addValue((Shared.share.loginData?.token == nil) ? "" : "Bearer \("\(Shared.share.loginData?.token ?? "")")", forHTTPHeaderField: "Authorization")
//        //        } else {
//        //            request.addValue("", forHTTPHeaderField: "Authorization")
//        //            Shared.share.isRequestWithoutAuthorize = false
//        //        }
//        saveAccessToken = Shared.share.access_token ?? ""
//        saveTokenType   = Shared.share.access_token_type ?? ""
//        if let _ = Shared.share.access_token {
//            request.addValue("\(saveTokenType) \(saveAccessToken)", forHTTPHeaderField: "Authorization")
//            //            request.addValue("Bearer \(saveAccessToken) \(saveTokenType)", forHTTPHeaderField: "Authorization")
//        }
//        
//        request.httpMethod = httpMethod.rawValue
//        
////        #if DEBUG
//        
//        // Yuth: Request Log
//        // MARK:  Convert Dictionary To JSON & Print Log
//        // https://stackoverflow.com/questions/29625133/convert-dictionary-to-json-in-swift
//        let data = Data(strQuery.utf8)
//        do {
//            // make sure this JSON is in the format we expect
//            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                
//                if let theJSONData = try?  JSONSerialization.data(
//                    withJSONObject: dictionary,
//                    options: .prettyPrinted
//                ),
//                   let theJSONText = String(data: theJSONData,
//                                            encoding: String.Encoding.ascii) {
//                    //                         print("JSON string = \n\(theJSONText)")
//                    Log.r("""
//                       Request URL: \(request)
//                       Header : \(String(describing: request.allHTTPHeaderFields))
//                       Method : \(httpMethod.rawValue)
//                       Request Data   : \n\(theJSONText)
//                       """)
//                }
//            }
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//            // If Error Format print Log Below
//            Log.r("""
//               Request URL: \(request)
//               Header : \(String(describing: request.allHTTPHeaderFields))
//               Method : \(httpMethod.rawValue)
//               BODY   : \(strQuery)
//               """)
//        }
//        // -----------
//        
////        #endif
//        return request
//    }
    
    
}

