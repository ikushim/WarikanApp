//
//  ViewController.swift
//  Warikan
//
//  Created by nttr on 2017/09/27.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import TabPageViewController

class ViewController: UIViewController {
    var testNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tc = TabPageViewController.create()
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        let vc5 = UIViewController()
        
        // 画面に表示するラベル
        let screenWidth:CGFloat = view.frame.size.width
        let label1 = UILabel(frame: CGRect(x: -100, y: -100, width: screenWidth-20, height: 30))
        label1.textColor = UIColor.blue
        label1.textAlignment = NSTextAlignment.left
        let label2 = UILabel(frame: CGRect(x: 200, y: 200, width: 250, height: 30))
        let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        let label4 = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        let label5 = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        
        
        //label1.textAlignment = .center
        //label2.textAlignment = .center
        //label3.textAlignment = .center
        //label4.textAlignment = .center
        //label5.textAlignment = .center
        
        label1.text = String(testNumber)
        label2.text = "Aグループ：2,000円"
        label3.text = "Aグループ：1,000円"
        label4.text = "Aグループ：1,000円"
        label5.text = "Aグループ：1,000円"
        
        label1.center = vc1.view.center
        //label2.center = vc2.view.center
        label3.center = vc3.view.center
        label4.center = vc4.view.center
        label5.center = vc5.view.center
        
        vc1.view.addSubview(label1)
        vc2.view.addSubview(label2)
        vc3.view.addSubview(label3)
        vc4.view.addSubview(label4)
        vc5.view.addSubview(label5)
        

        
        // タブに表示するタイトル
        tc.tabItems = [(vc1, "案1"), (vc2, "案2"), (vc3, "案3"), (vc4, "案4"), (vc5, "案5")]
        // 無限に移動できる
        tc.isInfinity = true
        
        self.addChildViewController(tc)
        self.view.addSubview(tc.view)
        var option = TabPageOption()
        
        // 選択されたタブの文字&バーの色
        option.currentColor = UIColor(red: 0.5, green: 0.9, blue: 0.5, alpha: 1.0)
        
        tc.option = option
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func onClickMyButton(sender: UIButton){
        
        self.dismiss(animated: true, completion: nil)

    }
    
}
