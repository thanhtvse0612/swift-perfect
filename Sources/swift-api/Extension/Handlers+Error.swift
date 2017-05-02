//
//  HandlerHelper.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

extension Handlers {
    static func error(request:HTTPRequest, response:HTTPResponse, error:String, code:HTTPResponseStatus = .badRequest) {
        do {
            response.status = code
            try response.setBody(json: ["error":"\(code)"])
        } catch {
            print(error)
        }
        response.completed()
    }
}
