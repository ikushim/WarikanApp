//
//  DateModel.swift
//  Warikan
//
//  Created by nttr on 2017/10/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import Foundation

class DateModel {
    var dayName = ""
    var price = ""
    var date = ""
    
    init(dayName: String, price: String, date: String){
        self.dayName = dayName
        self.price = price
        self.date = date
    }
}
