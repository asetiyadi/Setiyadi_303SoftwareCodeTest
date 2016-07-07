//
//  DataModelView.swift
//  CodeTest-303Software
//
//  Created by Andi Setiyadi on 7/6/16.
//  Copyright © 2016 Devhubs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct DataModelView {
    
    var arrPerson = [Person]()
    
    typealias GetNameListHandler = (success: Bool, data: [Person]) -> Void
    mutating func getNameList(completionHandler: GetNameListHandler) {
        Alamofire.request(.GET, "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true")
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .Success:
                    guard let value = response.result.value else {
                        return
                    }
                    let json = JSON(value)
                    for data in json.arrayValue {
                        let person = Person(firstName: data["fname"].stringValue,
                            lastName: data["lname"].stringValue,
                            city: data["city"].stringValue)
                        
                        self.arrPerson.append(person)
                    }
                    completionHandler(success: true, data: self.arrPerson)
                    
                case .Failure:
                    completionHandler(success: false, data: [])
                }
        }
    }
}
