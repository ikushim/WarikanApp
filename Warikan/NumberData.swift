//
//  NumberData.swift
//  Warikan
//
//  Created by nttr on 2017/10/04.
//  Copyright © 2017年 nttr. All rights reserved.
//

import Foundation

class NumberData {
    class func getNumberData() -> [NumberDataModel]{
        var data = [NumberDataModel]()
        data.append(NumberDataModel(numberOfPeople: "0人"))
        data.append(NumberDataModel(numberOfPeople: "1人"))
        data.append(NumberDataModel(numberOfPeople: "2人"))
        data.append(NumberDataModel(numberOfPeople: "3人"))
        data.append(NumberDataModel(numberOfPeople: "4人"))
        data.append(NumberDataModel(numberOfPeople: "5人"))
        data.append(NumberDataModel(numberOfPeople: "6人"))
        data.append(NumberDataModel(numberOfPeople: "7人"))
        data.append(NumberDataModel(numberOfPeople: "8人"))
        data.append(NumberDataModel(numberOfPeople: "9人"))
        data.append(NumberDataModel(numberOfPeople: "10人"))
        
        return data
    }
    
    
    
}
