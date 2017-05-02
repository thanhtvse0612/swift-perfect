//
//  ObjectMapper.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/29/17.
//
//

import Foundation

protocol Mappable: class {
    init?(with dict: [String: Any])
    func mapping(with dict: [String : Any])
}

protocol HELLo {
    init?(with dic:[String:Any])
}

class Mapper<T: Mappable> {
    init() {}
    
    func map(dict: [String:Any]) -> T? {
        if let klass = T(with: dict) {
            klass.mapping(with: dict)
            return klass
        }
        
        return nil
    }
}

infix operator <-
func <- <A, B>(_ lhs: inout A, _ rhs: B?) {
    func optionalBasicType<FieldType>(_ field: inout FieldType, object: FieldType?) {
        if let value = object {
            field = value
        }
    }
    optionalBasicType(&lhs, object: rhs as? A)
}

