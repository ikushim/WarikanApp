//
//  InputViewController.swift
//  Warikan
//
//  Created by nttr on 2017/10/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class InputViewController: UIViewController{

    @IBOutlet weak var moneyPicker: UIPickerView!
    @IBOutlet weak var groupAPicker: UIPickerView!
    @IBOutlet weak var groupBPicker: UIPickerView!
    @IBOutlet weak var groupCPicker: UIPickerView!
    
    @IBOutlet weak var testLabel: UILabel!
    
    var dateModelPicker: DateModelPicker!
    var numberModelPicker: NumberModelPicker!
    
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(pickerChanged), name: .pickersChanged, object: nil)
        rotationAngle = -90 * (.pi/180)
        dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Data.getData()
        
        numberModelPicker = NumberModelPicker()
        numberModelPicker.modelData = NumberData.getNumberData()
        
        var y = moneyPicker.frame.origin.y
        moneyPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        moneyPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        moneyPicker.delegate = dateModelPicker
        moneyPicker.dataSource = dateModelPicker
        moneyPicker.selectRow(20, inComponent: 0, animated: true)
        
        y = groupAPicker.frame.origin.y
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.delegate = numberModelPicker
        groupAPicker.dataSource = numberModelPicker
        
        y = groupBPicker.frame.origin.y
        groupBPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupBPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        groupBPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupBPicker.delegate = numberModelPicker
        groupBPicker.dataSource = numberModelPicker
        
        y = groupCPicker.frame.origin.y
        groupCPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupCPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        groupCPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupCPicker.delegate = numberModelPicker
        groupCPicker.dataSource = numberModelPicker
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func liquidation(){
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面のオブジェクトを取得
        let viewController = segue.destination as!ViewController
        viewController.testNumber = 5
    }
    
    
    func pickerChanged(){
        let test1 = moneyPicker.selectedRow(inComponent: 0)
        let test2 = groupAPicker.selectedRow(inComponent: 0)
        let test3 = groupBPicker.selectedRow(inComponent: 0)
        let test4 = groupCPicker.selectedRow(inComponent: 0)
        let test5 = test1 + test2 + test3 + test4
        testLabel.text = String(test5)
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
