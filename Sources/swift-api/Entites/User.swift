//
//  User.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/29/17.
//
//

import Foundation
import MySQLStORM
import StORM

class User: MySQLStORM, Mappable {
    var username    : String    =  ""
    var password    : String    =  ""
    var address     : String    =  ""
    var email       : String    =  ""
    var phone       : String    =  ""
    var role        : Int32     =   0
    
    override func table() -> String {
        return "user"
    }
    
    override init() {}
    
    required init?(with dict: [String : Any]) {}
    
    override func to(_ this: StORMRow) {
        mapping(with: this.data)
    }
    
    func mapping(with dict: [String : Any]) {
        self.username   <- dict["username"]
        self.address    <- dict["address"]
        self.email      <- dict["email"]
        self.phone      <- dict["phone"]
        self.role       <- dict["role"]
        self.password   <- dict["password"]
    }
    
}
