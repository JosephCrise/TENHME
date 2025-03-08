//
//  Encodable.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
extension Encodable {
    
    func asJSONString() -> String? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData    = try jsonEncoder.encode(self)
            let jsonString  = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            return nil
        }
    }
    
}
