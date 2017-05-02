//
//  HTTPResponse+Completion.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/29/17.
//
//

import PerfectHTTP

extension HTTPResponse {
    var completion: ([String:Any]) -> () {
        get {
            return { serviceResult in
                do {
                    debugPrint(serviceResult)
                    try self.setBody(json: serviceResult)
                } catch  {
                    Handlers.error(request: self.request, response: self, error: "\(error)", code: .badRequest)
                }
            }
        }
    }
    
    func defaultResponse()  {
        self.setHeader(.contentType, value: "application/json;charset=UTF-8")
        self.setHeader(.contentType, value: "application/json")
        self.completed()
    }
    
}
