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
     private var myLeftButton: UIBarButtonItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigationController?.setNavigationBarHidden(true, animated: false)
        //戻るボタンを隠す
        self.navigationItem.hidesBackButton = true
        
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
        
        label1.text = "Aグループ：1,000円"
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
        
        let nc = UINavigationController()
        nc.viewControllers = [tc]
        var option = TabPageOption()
        
        // 選択されたタブの文字&バーの色
        option.currentColor = UIColor(red: 0.5, green: 0.9, blue: 0.5, alpha: 1.0)
        
        tc.option = option
        //tc.navigationItem.hidesBackButton = true
        
        myLeftButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: "onClickMyButton:")
        myLeftButton.tag = 1
        tc.navigationItem.leftBarButtonItem = myLeftButton
        
        // 表示する
        navigationController?.pushViewController(tc, animated: false)
        //
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
