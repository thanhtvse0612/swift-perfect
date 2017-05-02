//
//  Handlers.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

class Handlers {
    
    static func main() -> RequestHandler {
        return {
            request, response in
            response.setBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
            response.completed()
        }
    }
    
}
