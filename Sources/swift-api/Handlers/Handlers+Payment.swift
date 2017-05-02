//
//  Handlers+ListProduct.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

extension Handlers {
    
    static func checkout() -> RequestHandler {
        return { request, response in
            if let jsonEncoded = request.jsonDecoded {
                let services = Services(withService: .PaymentServices(.checkOut(jsonEncoded)))
                services.completion = response.completion
            }
            
            response.defaultResponse()
        }
    }
}


