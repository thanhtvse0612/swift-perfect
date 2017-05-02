//
//  Handlers+Authentication.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/29/17.
//
//

import PerfectHTTP

extension Handlers {
    
    static func login() -> RequestHandler {
        return { request, response in
            if let jsonDecoded = request.jsonDecoded {
                let service = Services(withService: .AuthenServices(.login(jsonDecoded)))
                service.completion = response.completion
            }
            
            response.defaultResponse()
        }
    }
    
    static func register() -> RequestHandler {
        return { request, response in
            if let jsonDecoded = request.jsonDecoded {
                let services = Services(withService: .AuthenServices(.register(jsonDecoded)))
                services.completion = response.completion
            }

            response.defaultResponse()
        }
    }
}
