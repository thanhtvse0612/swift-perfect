//
//  ProductServices.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import Foundation
import MySQLStORM
import PerfectHTTP
import StORM

enum ServiceResult<S, E, A> {
    case success (S, E, A)
    case failure (S, E, A)
    
    func flatMap<R>(_ f: (S, E, A) -> R) -> R{
        switch self {
        case let .success(s, e, a):
            return f(s, e, a)
        case let .failure(s, e, a):
            return f(s, e, a)
        }
    }
}

enum ServiceTypes {
    case ProductServices(ProductServices)
    case AuthenServices(AuthenServices)
    case PaymentServices(PaymentServices)
}

class Services {
    var serviceType: ServiceTypes
    
    var completion: (([String:Any]) -> ())? {
        didSet {
            switch self.serviceType {
            case let .ProductServices(productService):
                self.completion?(implementProductService(productService))
            case let .AuthenServices(authenService):
                self.completion?(implementAuthenService(authenService))
            case let .PaymentServices(paymentServices):
                self.completion?(implementPaymentService(paymentServices))
            }
        }
    }
    
    init(withService service:ServiceTypes) {
        self.serviceType = service
    }
    
    private func implementProductService(_ productService : ProductServices) -> [String:Any] {
        return productService.implement().flatMap { status, message, data in
            generateRepsonseDictionaryWith(statusCode: status, message: message, data: data)
        }
    }
    
    private func implementAuthenService(_ authenService : AuthenServices) -> [String:Any] {
        return authenService.implement().flatMap { status, message, data in
            generateRepsonseDictionaryWith(statusCode: status, message: message, data: data)
        }
    }

    private func implementPaymentService(_ authenService : PaymentServices) -> [String:Any] {
        return authenService.implement().flatMap { status, message, data in
            generateRepsonseDictionaryWith(statusCode: status, message: message, data: data)
        }
    }
}
