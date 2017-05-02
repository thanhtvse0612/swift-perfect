//
//  HTTPRequest.swift
//  swift-api
//
//  Created by Tran Van Thanh on 5/1/17.
//
//

import PerfectHTTP

extension HTTPRequest {
    var jsonDecoded : [String:Any]? {
        get {
            if let data = self.postBodyString {
                let obj = try? data.jsonDecode() as? [String:Any]
                return obj ?? [String:Any]()
            }
            
            return nil
        }
    }
}
