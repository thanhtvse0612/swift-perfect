//
//  Handlers.swift
//  swift-api
//
//  Created by Tran Van Thanh on 4/26/17.
//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import MySQLStORM

import PerfectRequestLogger
import PerfectLogger

MySQLConnector.host		= "127.0.0.1"
MySQLConnector.username	= "root"
MySQLConnector.password	= "Karemsocola@580435"
MySQLConnector.database	= "system_engine_bot_db"
MySQLConnector.port		= 3306

let server = HTTPServer()
// Instantiate a logger
let myLogger = RequestLogger()

// Add the filters
// Request filter at high priority to be executed first
server.setRequestFilters([(myLogger, .high)])
// Response filter at low priority to be executed last
server.setResponseFilters([(myLogger, .low)])

var routes = Routes()

let httplogger = RequestLogger()
LogFile.location = "./webLog.log"

routes.add(method: .get, uri: "/", handler: Handlers.main())
routes.add(method: .get, uri: "/api/listProduct", handler: Handlers.getListProduct())
routes.add(method: .get, uri: "/api/listProduct/{productId}", handler: Handlers.getProductById())
routes.add(method: .post, uri: "/api/login", handler: Handlers.login())
routes.add(method: .post, uri: "/api/register", handler: Handlers.register())

routes.add(method: .post, uri: "/api/checkout", handler: Handlers.checkout())



server.addRoutes(routes)

server.serverPort = 3000

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    debugPrint("Network error thrown: \(err) \(msg)")
}


