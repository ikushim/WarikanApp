//
//  DateModelPicker.swift
//  Warikan
//
//  Created by nttr on 2017/10/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class DateModelPicker: UIPickerView{
    var modelData: [DateModel]!
    let customWidth: CGFloat = 140
    let customHeight: CGFloat = 100
}

extension DateModelPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}

extension DateModelPicker: UIPickerViewDelegate {
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //    return modelData[row].price
    //}
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        
        let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row].price
        middleLabel.textColor = UIColor.black
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightThin)
        view.addSubview(middleLabel)
        
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NotificationCenter.default.post(name: .pickersChanged, object: self)
    }
}
