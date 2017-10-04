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
    
    var numMoney:Int = 0
    var numGroupA:Int = 0
    var numGroupB:Int = 0
    var numGroupC:Int = 0
    
    var dateModelPicker: DateModelPicker!
    var numberModelPicker: NumberModelPicker!
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NotificationCenter.default.addObserver(self, selector: #selector(pickerChanged), name: .pickersChanged, object: nil)
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
        numGroupA = groupAPicker.selectedRow(inComponent: 0)
        numGroupB = groupBPicker.selectedRow(inComponent: 0)
        numGroupC = groupCPicker.selectedRow(inComponent: 0)
        let total = numGroupA + numGroupB + numGroupC
        
        if (total == 0){
            numAlert()
        } else {
            self.performSegue(withIdentifier: "toSecond", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        numGroupA = groupAPicker.selectedRow(inComponent: 0)
        numGroupB = groupBPicker.selectedRow(inComponent: 0)
        numGroupC = groupCPicker.selectedRow(inComponent: 0)
        let StrMoney = dateModelPicker.modelData[moneyPicker.selectedRow(inComponent: 0)].price.replacingOccurrences(of: ",", with: "")
        numMoney = Int(StrMoney.substring(to: StrMoney.index(before: StrMoney.endIndex)))!
        
        //次の画面のオブジェクトを取得
        let viewController = segue.destination as!ViewController
        viewController.numGroupA = numGroupA
        viewController.numGroupB = numGroupB
        viewController.numGroupC = numGroupC
        viewController.numMoney = numMoney
    }
    
    func numAlert(){
        let alertText = "人数を入力してください"
        let alertController = UIAlertController(title: "Alert", message: alertText, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            //self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
