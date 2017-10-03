//
//  InputViewController.swift
//  Warikan
//
//  Created by nttr on 2017/10/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class InputViewController: UIViewController{
    
    let moneyList = ["10,000円", "10,500円", "11,000円", "11,500円", "12,000円", "12,500円", "13,000円", "13,500円", "14,000円", "14,500円", "15,000円", "15,500円", "16,000円", "16,500円", "17,000円", "17,500円", "18,000円", "18,500円", "19,000円", "19,500円", "20,000円"]
    

    @IBOutlet weak var moneyPicker: UIPickerView!
    @IBOutlet weak var groupAPicker: UIPickerView!
    //@IBOutlet weak var groupBPicker: UIPickerView!
    //@IBOutlet weak var groupCPicker: UIPickerView!
    
    @IBOutlet weak var testLabel: UILabel!
    
    //var moneyPickerDelDataSource: MonthYearPickerView!
    var dateModelPicker: DateModelPicker!
    
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
        rotationAngle = -90 * (.pi/180)
        dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Data.getData()
        
        var y = moneyPicker.frame.origin.y
        moneyPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        moneyPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        moneyPicker.delegate = dateModelPicker
        moneyPicker.dataSource = dateModelPicker
        
        y = groupAPicker.frame.origin.y
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.delegate = dateModelPicker
        groupAPicker.dataSource = dateModelPicker
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
