//
//  ViewController.swift
//  AlamofirePOC
//
//  Created by arodriguez on 1/21/16.
//  Copyright © 2016 Alejandro rodriguez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
//        let urlRequestConvertible = Router.Photos
//        urlRequestConvertible.URLRequest.cachePolicy = .ReturnCacheDataElseLoad
//        Alamofire.request(urlRequestConvertible).validate().responseJSON {
//            response  -> Void in
//            
//            switch response.result{
//            case .Success:
//                print(response.result.value)
//            case .Failure(let error):
//                print(error)
//            }
//            
//
//            
//        }
        
        
        //        Alamofire.request(.GET, "https://wallet-api.urbanairship.com/v1/download/pass/b300c873-f4c9-422c-bf16-785d6e20dda7").response { (_, _, data, _) -> Void in
        //            print(data)
        //        }
        
        Alamofire.request(.GET, "https://upload.wikimedia.org/wikipedia/commons/f/fa/Grand-Bazaar_Shop.jpg").responseUIImage { (response) -> Void in
            let image = response.result.value
            print(image)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

