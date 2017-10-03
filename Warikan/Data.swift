//
//  Data.swift
//  Warikan
//
//  Created by nttr on 2017/10/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import Foundation

class Data {
    class func getData() -> [DateModel]{
        var data = [DateModel]()
        data.append(DateModel(dayName: "Monday", price: "$80", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$85", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$90", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$95", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$100", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$105", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$110", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$115", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$120", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$125", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$130", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$135", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$140", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "$145", date: "02 MAY 2017"))
        data.append(DateModel(dayName: "Monday", price: "$150", date: "01 MAY 2017"))
        data.append(DateModel(dayName: "Tuesday", price: "99,500" , date: "02 MAY 2017"))
    
        return data
    }

    

}
