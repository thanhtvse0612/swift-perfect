//
//  Response.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/28/17.
//
//

import Foundation


class ResponseObject: Mappable {

    var statusCode: Int!
    var message: String!
    var data: [Any]!
    
    required init?(with dict: [String : Any]) {
        print("init")
    }
    
    func mapping(with dict: [String : Any]) {
        self.data       <- dict[Constants.ResponseContants.data]
        self.message    <- dict[Constants.ResponseContants.message]
        self.statusCode <- dict[Constants.ResponseContants.statusCode]
    }
}



