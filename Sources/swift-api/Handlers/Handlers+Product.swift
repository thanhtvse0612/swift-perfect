//
//  Handlers+ListProduct.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

extension Handlers {
    
    static func getListProduct() -> RequestHandler {
        return { request, response in
            let service = Services(withService: .ProductServices(.getListProduct))
            service.completion = response.completion
            
            response.defaultResponse()
        }
    }
    
    static func getProductById() -> RequestHandler {
        return { request, response in
            if let productId = request.urlVariables["productid"] {
                let services = Services(withService: .ProductServices(.getProductById(Int(productId) ?? 0)))
                services.completion = response.completion
            }
            
            response.defaultResponse()
        }
    }
}


