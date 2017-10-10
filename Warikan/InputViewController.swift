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
    var numDraft = 0
    var draft1 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft2 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft3 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft4 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft5 = ["false","0","0","0","0","0","0","0","0","0"]
    
    var dateModelPicker: DateModelPicker!
    var numberModelPicker: NumberModelPicker!
    var rotationAngle: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotationAngle = -90 * (.pi/180)
        dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Data.getData()
        numberModelPicker = NumberModelPicker()
        numberModelPicker.modelData = NumberData.getNumberData()
        
        var y = moneyPicker.frame.origin.y
        moneyPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        moneyPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 50)
        moneyPicker.delegate = dateModelPicker
        moneyPicker.dataSource = dateModelPicker
        moneyPicker.selectRow(20, inComponent: 0, animated: true)
        
        y = groupAPicker.frame.origin.y
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 50)
        groupAPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupAPicker.delegate = numberModelPicker
        groupAPicker.dataSource = numberModelPicker
        
        y = groupBPicker.frame.origin.y
        groupBPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupBPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 50)
        groupBPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupBPicker.delegate = numberModelPicker
        groupBPicker.dataSource = numberModelPicker
        
        y = groupCPicker.frame.origin.y
        groupCPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        groupCPicker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 50)
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
            //人数選択されていない場合アラート表示
            numAlert()
        } else {
            //人数が選択されていたら次の画面へ遷移
            self.performSegue(withIdentifier: "toSecond", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        numGroupA = groupAPicker.selectedRow(inComponent: 0)
        numGroupB = groupBPicker.selectedRow(inComponent: 0)
        numGroupC = groupCPicker.selectedRow(inComponent: 0)
        let StrMoney = dateModelPicker.modelData[moneyPicker.selectedRow(inComponent: 0)].price.replacingOccurrences(of: ",", with: "")
        numMoney = Int(StrMoney.substring(to: StrMoney.index(before: StrMoney.endIndex)))!

        //割り勘案初期化
        numDraft = 0
        draft1 = ["false","0","0","0","0","0","0","0","0","0"]
        draft2 = ["false","0","0","0","0","0","0","0","0","0"]
        draft3 = ["false","0","0","0","0","0","0","0","0","0"]
        draft4 = ["false","0","0","0","0","0","0","0","0","0"]
        draft5 = ["false","0","0","0","0","0","0","0","0","0"]
        
        //割り勘案の作成
        if numGroupA == 0 {
            if numGroupB == 0 {
                //#Cのみパターン（A:0人、B:0人、C:1人以上）
                //##案1の作成
                //###人数で支払額を割り、100円単位で切り上げ
                var num1 = Double(numMoney) / Double(numGroupC) / 100
                num1 = ceil(num1)
                num1 = num1 * 100
                
                var total1 = Int(num1) * numGroupC
                var difference1 = total1 - numMoney
                
                draft1[0] = "true"
                draft1[1] = "0人"
                draft1[2] = "0円"
                draft1[3] = "0人"
                draft1[4] = "0円"
                draft1[5] = String(numGroupC) + "人"
                draft1[6] = moneyStyle(num: Int(num1))
                draft1[7] = moneyStyle(num: numMoney)
                draft1[8] = moneyStyle(num: total1)
                draft1[9] = moneyStyle(num: difference1)
                numDraft = 1
                
                //案2の作成
                //##500円単位で切り上げ
                var num2 = ceil(num1 / 500) * 500
                
                //案1と案2が異なる値の場合のみプラン作成
                if Int(num1) != Int(num2){
                    var total2 = Int(num2) * numGroupC
                    var difference2 = total2 - numMoney
                    
                    draft2[0] = "true"
                    draft2[1] = "0人"
                    draft2[2] = "0円"
                    draft2[3] = "0人"
                    draft2[4] = "0円"
                    draft2[5] = String(numGroupC) + "人"
                    draft2[6] = moneyStyle(num: Int(num2))
                    draft2[7] = moneyStyle(num: numMoney)
                    draft2[8] = moneyStyle(num: total2)
                    draft2[9] = moneyStyle(num: difference2)
                    numDraft = 2
                }
                
            }else if numGroupC == 0 {
                //Bのみパターン
                //##案1の作成
                //###人数で支払額を割り、100円単位で切り上げ
                var num1 = Double(numMoney) / Double(numGroupB) / 100
                num1 = ceil(num1)
                num1 = num1 * 100
                
                var total1 = Int(num1) * numGroupB
                var difference1 = total1 - numMoney
                
                
                draft1[0] = "true"
                draft1[1] = "0人"
                draft1[2] = "0円"
                draft1[3] = String(numGroupB) + "人"
                draft1[4] = moneyStyle(num: Int(num1))
                draft1[5] = "0人"
                draft1[6] = "0円"
                draft1[7] = moneyStyle(num: numMoney)
                draft1[8] = moneyStyle(num: total1)
                draft1[9] = moneyStyle(num: difference1)
                numDraft = 1
                
                //案2の作成
                //##500円単位で切り上げ
                var num2 = ceil(num1 / 500) * 500
                
                //案1と案2が異なる値の場合のみプラン作成
                if Int(num1) != Int(num2){
                    var total2 = Int(num2) * numGroupB
                    var difference2 = total2 - numMoney
                    
                    draft2[0] = "true"
                    draft2[1] = "0人"
                    draft2[2] = "0円"
                    draft2[3] = String(numGroupB) + "人"
                    draft2[4] = moneyStyle(num: Int(num2))
                    draft2[5] = "0人"
                    draft2[6] = "0円"
                    draft2[7] = moneyStyle(num: numMoney)
                    draft2[8] = moneyStyle(num: total2)
                    draft2[9] = moneyStyle(num: difference2)
                    numDraft = 2
                }
                
            }else {
                //B,Cパターン
                //##案1の作成
                //##倍率1.2
                var result1 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.2)
                
                draft1[0] = "true"
                draft1[1] = "0人"
                draft1[2] = "0円"
                draft1[3] = String(numGroupB) + "人"
                draft1[4] = result1.high
                draft1[5] = String(numGroupC) + "人"
                draft1[6] = result1.low
                draft1[7] = moneyStyle(num: numMoney)
                draft1[8] = result1.total
                draft1[9] = result1.dif
                
                //##案2の作成
                //##倍率1.3
                var result2 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.4)
                
                draft2[0] = "true"
                draft2[1] = "0人"
                draft2[2] = "0円"
                draft2[3] = String(numGroupB) + "人"
                draft2[4] = result2.high
                draft2[5] = String(numGroupC) + "人"
                draft2[6] = result2.low
                draft2[7] = moneyStyle(num: numMoney)
                draft2[8] = result2.total
                draft2[9] = result2.dif
                
                
                //##案3の作成
                //##倍率1.4
                var result3 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.6)
                
                draft3[0] = "true"
                draft3[1] = "0人"
                draft3[2] = "0円"
                draft3[3] = String(numGroupB) + "人"
                draft3[4] = result3.high
                draft3[5] = String(numGroupC) + "人"
                draft3[6] = result3.low
                draft3[7] = moneyStyle(num: numMoney)
                draft3[8] = result3.total
                draft3[9] = result3.dif
                
                
                //##案4の作成
                //##倍率1.5
                var result4 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.8)
                
                draft4[0] = "true"
                draft4[1] = "0人"
                draft4[2] = "0円"
                draft4[3] = String(numGroupB) + "人"
                draft4[4] = result4.high
                draft4[5] = String(numGroupC) + "人"
                draft4[6] = result4.low
                draft4[7] = moneyStyle(num: numMoney)
                draft4[8] = result4.total
                draft4[9] = result4.dif
                
                
                //##案5の作成
                //##倍率1.6
                var result5 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 2.0)
                
                draft5[0] = "true"
                draft5[1] = "0人"
                draft5[2] = "0円"
                draft5[3] = String(numGroupB) + "人"
                draft5[4] = result5.high
                draft5[5] = String(numGroupC) + "人"
                draft5[6] = result5.low
                draft5[7] = moneyStyle(num: numMoney)
                draft5[8] = result5.total
                draft5[9] = result5.dif
                
                numDraft = 5
                
                
            }
        }else if numGroupB == 0 {
            if numGroupC == 0{
                //Aのみパターン
                //##案1の作成
                //###人数で支払額を割り、100円単位で切り上げ
                var num1 = Double(numMoney) / Double(numGroupA) / 100
                num1 = ceil(num1)
                num1 = num1 * 100
                
                var total1 = Int(num1) * numGroupA
                var difference1 = total1 - numMoney
                
                draft1[0] = "true"
                draft1[1] = String(numGroupA) + "人"
                draft1[2] = moneyStyle(num: Int(num1))
                draft1[3] = "0人"
                draft1[4] = "0円"
                draft1[5] = "0人"
                draft1[6] = "0円"
                draft1[7] = moneyStyle(num: numMoney)
                draft1[8] = moneyStyle(num: total1)
                draft1[9] = moneyStyle(num: difference1)
                numDraft = 1
                
                //案2の作成
                //##500円単位で切り上げ
                var num2 = ceil(num1 / 500) * 500
                
                //案1と案2が異なる値の場合のみプラン作成
                if Int(num1) != Int(num2){
                    var total2 = Int(num2) * numGroupA
                    var difference2 = total2 - numMoney
                    
                    draft2[0] = "true"
                    draft2[1] = String(numGroupA) + "人"
                    draft2[2] = moneyStyle(num: Int(num2))
                    draft2[3] = "0人"
                    draft2[4] = "0円"
                    draft2[5] = "0人"
                    draft2[6] = "0円"
                    draft2[7] = moneyStyle(num: numMoney)
                    draft2[8] = moneyStyle(num: total2)
                    draft2[9] = moneyStyle(num: difference2)
                    numDraft = 2
                }
                
            }else {
                //A,Cパターン
                //##案1の作成
                //##倍率1.2
                var result1 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupC, mag: 1.4)
                
                draft1[0] = "true"
                draft1[1] = String(numGroupA) + "人"
                draft1[2] = result1.high
                draft1[3] = "0人"
                draft1[4] = "0円"
                draft1[5] = String(numGroupC) + "人"
                draft1[6] = result1.low
                draft1[7] = moneyStyle(num: numMoney)
                draft1[8] = result1.total
                draft1[9] = result1.dif
                
                //##案2の作成
                //##倍率1.3
                var result2 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.6)
                
                draft2[0] = "true"
                draft2[1] = String(numGroupA) + "人"
                draft2[2] = result2.high
                draft2[3] = "0人"
                draft2[4] = "0円"
                draft2[5] = String(numGroupC) + "人"
                draft2[6] = result2.low
                draft2[7] = moneyStyle(num: numMoney)
                draft2[8] = result2.total
                draft2[9] = result2.dif
                
                
                //##案3の作成
                //##倍率1.4
                var result3 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 2.0)
                
                draft3[0] = "true"
                draft3[1] = String(numGroupA) + "人"
                draft3[2] = result3.high
                draft3[3] = "0人"
                draft3[4] = "0円"
                draft3[5] = String(numGroupC) + "人"
                draft3[6] = result3.low
                draft3[7] = moneyStyle(num: numMoney)
                draft3[8] = result3.total
                draft3[9] = result3.dif
                
                
                //##案4の作成
                //##倍率1.5
                var result4 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 2.5)
                
                draft4[0] = "true"
                draft4[1] = String(numGroupA) + "人"
                draft4[2] = result4.high
                draft4[3] = "0人"
                draft4[4] = "0円"
                draft4[5] = String(numGroupC) + "人"
                draft4[6] = result4.low
                draft4[7] = moneyStyle(num: numMoney)
                draft4[8] = result4.total
                draft4[9] = result4.dif
                
                
                //##案5の作成
                //##倍率1.6
                var result5 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 3.0)
                
                draft5[0] = "true"
                draft5[1] = String(numGroupA) + "人"
                draft5[2] = result5.high
                draft5[3] = "0人"
                draft5[4] = "0円"
                draft5[5] = String(numGroupC) + "人"
                draft5[6] = result5.low
                draft5[7] = moneyStyle(num: numMoney)
                draft5[8] = result5.total
                draft5[9] = result5.dif
                
                numDraft = 5
                
                
            }
        }else if numGroupC == 0{
            //A,Bパターン
            //##案1の作成
            //##倍率1.2
            var result1 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.2)
            
            draft1[0] = "true"
            draft1[1] = String(numGroupA) + "人"
            draft1[2] = result1.high
            draft1[3] = String(numGroupB) + "人"
            draft1[4] = result1.low
            draft1[5] = "0人"
            draft1[6] = "0円"
            draft1[7] = moneyStyle(num: numMoney)
            draft1[8] = result1.total
            draft1[9] = result1.dif
            
            //##案2の作成
            //##倍率1.3
            var result2 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.4)
            
            draft2[0] = "true"
            draft2[1] = String(numGroupA) + "人"
            draft2[2] = result2.high
            draft2[3] = String(numGroupB) + "人"
            draft2[4] = result2.low
            draft2[5] = "0人"
            draft2[6] = "0円"
            draft2[7] = moneyStyle(num: numMoney)
            draft2[8] = result2.total
            draft2[9] = result2.dif
            
           
            //##案3の作成
            //##倍率1.4
            var result3 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.6)
            
            draft3[0] = "true"
            draft3[1] = String(numGroupA) + "人"
            draft3[2] = result3.high
            draft3[3] = String(numGroupB) + "人"
            draft3[4] = result3.low
            draft3[5] = "0人"
            draft3[6] = "0円"
            draft3[7] = moneyStyle(num: numMoney)
            draft3[8] = result3.total
            draft3[9] = result3.dif
            
            
            //##案4の作成
            //##倍率1.5
            var result4 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 1.8)
            
            draft4[0] = "true"
            draft4[1] = String(numGroupA) + "人"
            draft4[2] = result4.high
            draft4[3] = String(numGroupB) + "人"
            draft4[4] = result4.low
            draft4[5] = "0人"
            draft4[6] = "0円"
            draft4[7] = moneyStyle(num: numMoney)
            draft4[8] = result4.total
            draft4[9] = result4.dif
            
            
            //##案5の作成
            //##倍率1.6
            var result5 = calcAB(money: numMoney, numA: numGroupA, numB: numGroupB, mag: 2.0)
            
            draft5[0] = "true"
            draft5[1] = String(numGroupA) + "人"
            draft5[2] = result5.high
            draft5[3] = String(numGroupB) + "人"
            draft5[4] = result5.low
            draft5[5] = "0人"
            draft5[6] = "0円"
            draft5[7] = moneyStyle(num: numMoney)
            draft5[8] = result5.total
            draft5[9] = result5.dif
            
            numDraft = 5
            
            
        }else{
            //A,B,Cパターン
            //##案1の作成
            //##倍率1.4,1.2
            var result1 = calcABC(money: numMoney, numA: numGroupA, numB: numGroupB, numC: numGroupC, mag1: 1.4, mag2: 1.2)
            
            draft1[0] = "true"
            draft1[1] = String(numGroupA) + "人"
            draft1[2] = result1.high
            draft1[3] = String(numGroupB) + "人"
            draft1[4] = result1.middle
            draft1[5] = String(numGroupC) + "人"
            draft1[6] = result1.low
            draft1[7] = moneyStyle(num: numMoney)
            draft1[8] = result1.total
            draft1[9] = result1.dif
            
            //##案2の作成
            //##倍率1.6,1.4
            var result2 = calcABC(money: numMoney, numA: numGroupA, numB: numGroupB, numC: numGroupC, mag1: 1.6, mag2: 1.4)
            
            draft2[0] = "true"
            draft2[1] = String(numGroupA) + "人"
            draft2[2] = result2.high
            draft2[3] = String(numGroupB) + "人"
            draft2[4] = result2.middle
            draft2[5] = String(numGroupC) + "人"
            draft2[6] = result2.low
            draft2[7] = moneyStyle(num: numMoney)
            draft2[8] = result2.total
            draft2[9] = result2.dif
            
            //##案3の作成
            //##倍率1.8,1.4
            var result3 = calcABC(money: numMoney, numA: numGroupA, numB: numGroupB, numC: numGroupC, mag1: 2.0, mag2: 1.4)
            
            draft3[0] = "true"
            draft3[1] = String(numGroupA) + "人"
            draft3[2] = result3.high
            draft3[3] = String(numGroupB) + "人"
            draft3[4] = result3.middle
            draft3[5] = String(numGroupC) + "人"
            draft3[6] = result3.low
            draft3[7] = moneyStyle(num: numMoney)
            draft3[8] = result3.total
            draft3[9] = result3.dif
            
            //##案4の作成
            //##倍率1.8,1.6
            var result4 = calcABC(money: numMoney, numA: numGroupA, numB: numGroupB, numC: numGroupC, mag1: 2.5, mag2: 1.8)
            
            draft4[0] = "true"
            draft4[1] = String(numGroupA) + "人"
            draft4[2] = result4.high
            draft4[3] = String(numGroupB) + "人"
            draft4[4] = result4.middle
            draft4[5] = String(numGroupC) + "人"
            draft4[6] = result4.low
            draft4[7] = moneyStyle(num: numMoney)
            draft4[8] = result4.total
            draft4[9] = result4.dif
            
            //##案5の作成
            //##倍率2.0,1.6
            var result5 = calcABC(money: numMoney, numA: numGroupA, numB: numGroupB, numC: numGroupC, mag1: 3.0, mag2: 2.0)
            
            draft5[0] = "true"
            draft5[1] = String(numGroupA) + "人"
            draft5[2] = result5.high
            draft5[3] = String(numGroupB) + "人"
            draft5[4] = result5.middle
            draft5[5] = String(numGroupC) + "人"
            draft5[6] = result5.low
            draft5[7] = moneyStyle(num: numMoney)
            draft5[8] = result5.total
            draft5[9] = result5.dif
            
            
            numDraft = 5
            
            
        }
        
        //次の画面のオブジェクトを取得
        let viewController = segue.destination as!ViewController
        viewController.numGroupA = numGroupA
        viewController.numGroupB = numGroupB
        viewController.numGroupC = numGroupC
        viewController.numMoney = numMoney
        viewController.draft1 = draft1
        viewController.draft2 = draft2
        viewController.draft3 = draft3
        viewController.draft4 = draft4
        viewController.draft5 = draft5
        viewController.numDraft = numDraft
    }
    
    
    //人数未選択時アラート用関数
    func numAlert(){
        let alertText = "人数を選択してください"
        let alertController = UIAlertController(title: "Alert", message: alertText, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            //self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //カンマ付き円表示用関数
    func moneyStyle(num: Int) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        var result = formatter.string(from: num as! NSNumber)! + "円"
        return result
    }
    
    
    func calcAB(money: Int ,numA: Int,numB: Int,mag: Double) -> (high: String, low: String, total: String, dif: String) {
        let hoge = Double(money) / ( Double(numA) * mag + Double(numB) ) / 100
        let tmpHigh = Int(ceil(hoge * mag) * 100)
        let high = moneyStyle(num:tmpHigh)
        let tmpLow = Int(ceil(hoge) * 100)
        let low = moneyStyle(num:tmpLow)
        let tmpTotal = Int(tmpHigh) * numA + Int(tmpLow) * numB
        let total = moneyStyle(num: tmpTotal)
        let tmpDif = tmpTotal - money
        let dif = moneyStyle(num: tmpDif)
        return (high,low,total,dif)
    }
    
    func calcABC(money: Int ,numA: Int, numB: Int , numC: Int , mag1: Double ,mag2: Double) -> (high: String, middle: String, low: String, total: String, dif: String) {
        let hoge = Double(money) / ( Double(numA) * mag1 + Double(numB) * mag2 + Double(numC) ) / 100
        let tmpHigh = Int(ceil(hoge * mag1) * 100)
        let high = moneyStyle(num:tmpHigh)
        let tmpMiddle = Int(ceil(hoge * mag2) * 100)
        let middle = moneyStyle(num:tmpMiddle)
        let tmpLow = Int(ceil(hoge) * 100)
        let low = moneyStyle(num:tmpLow)
        let tmpTotal = Int(tmpHigh) * numA + Int(tmpMiddle) * numB + Int(tmpLow) * numC
        let total = moneyStyle(num: tmpTotal)
        let tmpDif = tmpTotal - money
        let dif = moneyStyle(num: tmpDif)
        return (high,middle,low,total,dif)
    }
    
    
}










