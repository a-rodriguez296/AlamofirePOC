//
//  AlamoServices.swift
//  AlamofirePOC
//
//  Created by arodriguez on 1/21/16.
//  Copyright © 2016 Alejandro rodriguez. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "nqRN4MbdV371CWCBIDn1BStcKj33LjjolHqTZySP"
    
   case Photos
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let result: (path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .Photos:
                let params = ["consumer_key": Router.consumerKey]
                return ("/photos", params)
            }
        }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
}



extension Request{
    
    public static func UIImageSerializer() -> ResponseSerializer<UIImage, NSError> {
        
        return ResponseSerializer{ request, response, data, error in
            
            guard error == nil else { return .Failure(error!) }
            
            if let image = UIImage(data: data!){
                return .Success(image)
            }
            else{
                return .Failure(error!)
            }
        }
    }
    
    public func responseUIImage(completionHandler: Response<UIImage, NSError> -> Void) -> Self {
        return response(responseSerializer: Request.UIImageSerializer(), completionHandler: completionHandler)
    }
}
