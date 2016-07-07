//
//  Person.swift
//  CodeTest-303Software
//
//  Created by Andi Setiyadi on 7/6/16.
//  Copyright © 2016 Devhubs. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String = ""
    var lastName: String = ""
    var city: String = ""
    
    init(firstName: String, lastName: String, city: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
    }
}