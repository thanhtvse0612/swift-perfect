//
//  ProductServices.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

enum ProductServices {
    case getListProduct
    case getProductById(Int)
    
    func implement() -> ServiceResult<HTTPResponseStatus, String, [Any]> {
        let product = Product()
        
        switch self {
        case .getListProduct:
            do {
                try product.select(whereclause: "productId>0 and productId<201", params: [], orderby: [])
                
                var data = [[String:Any]]()
                for obj in product.rows() {
                    data.append(obj.asDataDict())
                }
                
                return ServiceResult.success( .ok, "\(HTTPResponseStatus.ok)" ,data)
            } catch  {
                return ServiceResult.failure(.badRequest, "\(error)", [])
            }
        case let .getProductById(productId):
            do {
                guard productId > 0 else {
                    return ServiceResult.failure(.badRequest, "Invalid Product Id", [])
                }
                
                try product.get(productId)
                return ServiceResult.success(.ok, "\(HTTPResponseStatus.ok)" ,[product.asDataDict()])
            } catch {
                return ServiceResult.failure(.badRequest, "\(error)", [])
            }
        }
    }
}

