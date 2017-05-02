//
//  Utilities.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectHTTP
import Darwin

func generateRepsonseWith(statusCode: HTTPResponseStatus, message: String, data: [Any]) -> ResponseObject {
    let dict : [String:Any] = [Constants.ResponseContants.data: data,
                               Constants.ResponseContants.statusCode: "\(statusCode.code)",
                               Constants.ResponseContants.message: message]
    return Mapper<ResponseObject>().map(dict: dict)!
}

func generateRepsonseDictionaryWith(statusCode: HTTPResponseStatus, message: String, data: [Any]) -> [String:Any] {
    return [Constants.ResponseContants.data: data,
            Constants.ResponseContants.statusCode: "\(statusCode.code)",
            Constants.ResponseContants.message: message]
    
}
