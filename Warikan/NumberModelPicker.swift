//
//  NumberModelPicker.swift
//  Warikan
//
//  Created by nttr on 2017/10/04.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class NumberModelPicker: UIPickerView{
    var modelData: [NumberDataModel]!
    let customWidth: CGFloat = 140
    let customHeight: CGFloat = 100
}

extension NumberModelPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}

extension NumberModelPicker: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        
        let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row].numberOfPeople
        middleLabel.textColor = UIColor.black
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightThin)
        view.addSubview(middleLabel)
        
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        return view
    }
}
