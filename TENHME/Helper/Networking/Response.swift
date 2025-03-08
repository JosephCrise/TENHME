//
//  Response.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
struct Response<T: Codable>: Codable {
    
    var code    : Int?
    var message : String?
    var status  : Bool?
    var data    : T?
    
    var access_token : String?
    var error : String?
}
