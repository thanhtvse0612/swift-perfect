//
//  AuthenServices.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP

enum AuthenServices {
    case login([String:Any])
    case register([String:Any])
    
    func implement() -> ServiceResult<HTTPResponseStatus, String, [Any]> {
        let user = User()
        
        switch self {
        case let .login(jsonDecoded):
            do {
                guard let username = jsonDecoded["username"] as? String else {
                    return ServiceResult.failure(.badRequest, "\(HTTPResponseStatus.badRequest)", [])
                }
                
                guard let password = jsonDecoded["password"] as? String else {
                    return ServiceResult.failure(.badRequest, "\(HTTPResponseStatus.badRequest)", [])
                }
                
                try user.select(whereclause: "username = ? and password = ?", params: [username, password], orderby: [])
                
                if user.results.rows.count == 0 {
                    return ServiceResult.failure(.unauthorized, "\(HTTPResponseStatus.unauthorized)", [])
                }
                return ServiceResult.success(.ok, "\(HTTPResponseStatus.ok)" ,[user.asDataDict()])
            } catch {
                return ServiceResult.failure(.badRequest, "\(error)", [])
            }
        case let .register(jsonDecoded):
            do {
                guard let _ = jsonDecoded["username"] as? String,
                    let _ = jsonDecoded["password"] as? String,
                    let _ = jsonDecoded["email"] as? String,
                    let _ = jsonDecoded["address"] as? String,
                    let _ = jsonDecoded["phone"] as? String,
                    let _ = jsonDecoded["role"] as? Int
                    else {
                        return ServiceResult.failure(.badRequest, "\(HTTPResponseStatus.badRequest)", [])
                }
                
                user.mapping(with: jsonDecoded)
                try user.get()
                
                if user.results.rows.count == 1 {
                    return ServiceResult.failure(HTTPResponseStatus.conflict, "\(HTTPResponseStatus.conflict)", [])
                }
                
                try user.create()
                return ServiceResult.success(.ok, "\(HTTPResponseStatus.ok)", [user.asDataDict()])
            } catch {
                
                return ServiceResult.failure(.badRequest, "\(error)", [])
            }
        }
        
    }
}
