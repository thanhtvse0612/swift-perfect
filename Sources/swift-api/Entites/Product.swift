//
//  Product.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//
import StORM
import MySQLStORM

class Product : MySQLStORM, Mappable {
    var productId       : Int64  = 0
    var addressName     : String = ""
    var productName     : String = ""
    var thumbpath       : String = ""
    var districtName    : String = ""
    var latitude        : Double = 0.0
    var longitude       : Double = 0.0
    var rate            : String = ""
    var restaurantName  : String = ""
    var urlrelate       : String = ""
    
    override func table() -> String {
        return "productdetail"
    }
    
    override func to(_ this: StORMRow) {
//        productId       = this.data["productId"]        as? Int64 ?? 0
//        addressName     = this.data["addressName"]      as? String ?? ""
//        productName     = this.data["productName"]      as? String ?? ""
//        thumbpath       = this.data["thumbpath"]        as? String ?? ""
//        districtName    = this.data["districtName"]     as? String ?? ""
//        latitude        = this.data["latitude"]         as? Double ?? 0.0
//        longitude       = this.data["longitude"]        as? Double ?? 0.0
//        rate            = this.data["rate"]             as? String ?? ""
//        restaurantName  = this.data["restaurantName"]   as? String ?? ""
//        urlrelate       = this.data["urlrelate"]        as? String ?? ""
        mapping(with: this.data)
    }
    
    func rows() -> [Product] {
        var rows = [Product]()
        for i in 0..<self.results.rows.count {
            let row = Product()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
    
    override init() {}
    
    required init?(with dict: [String : Any]) {}
    
    func mapping(with dict: [String : Any]) {
        productId       <- dict["productId"]
        addressName     <- dict["addressName"]
        productName     <- dict["productName"]
        thumbpath       <- dict["thumbpath"]
        districtName    <- dict["districtName"]
        latitude        <- dict["latitude"]
        longitude       <- dict["longitude"]
        rate            <- dict["rate"]
        restaurantName  <- dict["restaurantName"]
        urlrelate       <- dict["urlrelate"]

    }
}
