//
//  Data.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation

extension Data {
    
    // - For Print Response Data
//    var prettyPrinted: String {
////        return MyJson.prettyPrint(value: self.dataToDic)
//    }
    var dataToDic: NSDictionary {
        guard let dic: NSDictionary = (try? JSONSerialization.jsonObject(with: self, options: [])) as? NSDictionary else {
            return [:]
        }
        
        return dic
    }
}
