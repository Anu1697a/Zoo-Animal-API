import Foundation

enum HTTPMethod: String {
    case get     = "GET"
}

protocol INetworkRequest {
    var path: String { get set }
    var method: HTTPMethod { get set }
    var headerParamaters: [String: String] { get set }
    var bodyParamaters: [String: Any] { get set }
}

class NetworkRequest: INetworkRequest {
    
    var path: String
    var method: HTTPMethod
    var headerParamaters: [String: String]
    var bodyParamaters: [String: Any]
   
    init(path: String,
         method: HTTPMethod,
         headerParamaters: [String: String] = [:],
         bodyParamaters: [String: Any] = [:]) {
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.bodyParamaters = bodyParamaters
    }
}
