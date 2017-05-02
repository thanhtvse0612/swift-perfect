//
//  Receipt.swift
//  swift-api
//
//  Created by Tran Van Thanh on 5/1/17.
//
//

import MySQLStORM
import StORM

class Receipt: MySQLStORM, Mappable {
    var receiptName     :   String  =   ""
    var datetime        :   String  =   ""
    var products        :   String  =   ""
    var priceTotal      :   String  =   ""
    var userId          :   Int   =   0
    
    required init?(with dict: [String : Any]) {}
    
    override init() {}
    
    override func table() -> String {
        return "receipt"
    }
    
    override func to(_ this: StORMRow) {
        mapping(with:this.data)
    }
    
    func mapping(with dict: [String : Any]) {
        self.receiptName    <-  dict["receiptName"]
        self.datetime       <-  dict["datetime"]
        self.products       <-  dict["products"]
        self.priceTotal     <-  dict["priceTotal"]
        self.userId         <-  dict["userId"]
    }
}
