//
//  PaymentServices.swift
//  swift-api
//
//  Created by Tran Van Thanh on 5/1/17.
//
//

import PerfectHTTP

enum PaymentServices {
    case checkOut([String:Any])
    
    func implement() -> ServiceResult<HTTPResponseStatus, String, [Any]> {
        let receipt = Receipt()
        
        switch self {
        case let .checkOut(jsonEncoded):
            do {
                guard let receiptName = jsonEncoded["receiptName"] as? String,
                    let datetime = jsonEncoded["datetime"] as? String,
                    let products = jsonEncoded["products"] as? String,
                    let priceTotal = jsonEncoded["priceTotal"] as? String,
                    let userId = jsonEncoded["userId"] as? Int else {
                        return ServiceResult.failure(.badRequest, "\(HTTPResponseStatus.badRequest)", [])
                }
                
                receipt.mapping(with: jsonEncoded)
//                let _ = try receipt.insert(cols: ["receipt_name", "date_time", "products", "price_total", "userid" ],
//                                   params: [receiptName, datetime, products, priceTotal, userId])
                
                try receipt.create()
                
                return ServiceResult.success(.ok, "\(HTTPResponseStatus.ok)", [receipt.asDataDict()])
            } catch {
                return ServiceResult.failure(.badRequest, "\(error)", [])
            }
        }
        
    }
}
