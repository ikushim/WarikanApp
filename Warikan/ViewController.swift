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
    var numMoney: Int = 0
    var numGroupA: Int = 0
    var numGroupB: Int = 0
    var numGroupC: Int = 0
    var testAllay = ["test","test"]
    var draft1 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft2 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft3 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft4 = ["false","0","0","0","0","0","0","0","0","0"]
    var draft5 = ["false","0","0","0","0","0","0","0","0","0"]
    var numDraft = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //案1画面の生成
        let vc1 = UIViewController()
        let screenWidth:CGFloat = view.frame.size.width
        let label101 = UILabel(frame: CGRect(x: 20, y: 120, width: screenWidth-30, height: 30))
        let label102 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-170, height: 30))
        let label103 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-30, height: 30))
        let label111 = UILabel(frame: CGRect(x: 20, y: 170, width: screenWidth-30, height: 30))
        let label112 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-170, height: 30))
        let label113 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-30, height: 30))
        let label121 = UILabel(frame: CGRect(x: 20, y: 220, width: screenWidth-30, height: 30))
        let label122 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-170, height: 30))
        let label123 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-30, height: 30))
        let label132 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-170, height: 30))
        let label133 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-30, height: 30))
        let label142 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-170, height: 30))
        let label143 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label152 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-170, height: 30))
        let label153 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-30, height: 30))
        //label101.textColor = UIColor.blue
        label101.textAlignment = NSTextAlignment.left
        label102.textAlignment = NSTextAlignment.right
        label103.textAlignment = NSTextAlignment.right
        label111.textAlignment = NSTextAlignment.left
        label112.textAlignment = NSTextAlignment.right
        label113.textAlignment = NSTextAlignment.right
        label121.textAlignment = NSTextAlignment.left
        label122.textAlignment = NSTextAlignment.right
        label123.textAlignment = NSTextAlignment.right
        label132.textAlignment = NSTextAlignment.right
        label133.textAlignment = NSTextAlignment.right
        label142.textAlignment = NSTextAlignment.right
        label143.textAlignment = NSTextAlignment.right
        label152.textAlignment = NSTextAlignment.right
        label153.textAlignment = NSTextAlignment.right

        //テキストの作成
        label101.text = "多く払う人"
        label102.text = draft1[1]
        label103.text = draft1[2]
        label111.text = "普通に払う人"
        label112.text = draft1[3]
        label113.text = draft1[4]
        label121.text = "少なく払う人"
        label122.text = draft1[5]
        label123.text = draft1[6]
        label132.text = "合計"
        label133.text = draft1[8]
        label142.text = "支払額"
        label143.text = draft1[7]
        label152.text = "余り"
        label153.text = draft1[9]
        
        //テキストの追加
        vc1.view.addSubview(label101)
        vc1.view.addSubview(label102)
        vc1.view.addSubview(label103)
        vc1.view.addSubview(label111)
        vc1.view.addSubview(label112)
        vc1.view.addSubview(label113)
        vc1.view.addSubview(label121)
        vc1.view.addSubview(label122)
        vc1.view.addSubview(label123)
        vc1.view.addSubview(label132)
        vc1.view.addSubview(label133)
        vc1.view.addSubview(label142)
        vc1.view.addSubview(label143)
        vc1.view.addSubview(label152)
        vc1.view.addSubview(label153)
        
        
        //案2画面の生成
        let vc2 = UIViewController()
        let label201 = UILabel(frame: CGRect(x: 20, y: 120, width: screenWidth-30, height: 30))
        let label202 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-170, height: 30))
        let label203 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-30, height: 30))
        let label211 = UILabel(frame: CGRect(x: 20, y: 170, width: screenWidth-30, height: 30))
        let label212 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-170, height: 30))
        let label213 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-30, height: 30))
        let label221 = UILabel(frame: CGRect(x: 20, y: 220, width: screenWidth-30, height: 30))
        let label222 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-170, height: 30))
        let label223 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-30, height: 30))
        let label232 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-170, height: 30))
        let label233 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-30, height: 30))
        let label242 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-170, height: 30))
        let label243 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label252 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-170, height: 30))
        let label253 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-30, height: 30))
        label201.textAlignment = NSTextAlignment.left
        label202.textAlignment = NSTextAlignment.right
        label203.textAlignment = NSTextAlignment.right
        label211.textAlignment = NSTextAlignment.left
        label212.textAlignment = NSTextAlignment.right
        label213.textAlignment = NSTextAlignment.right
        label221.textAlignment = NSTextAlignment.left
        label222.textAlignment = NSTextAlignment.right
        label223.textAlignment = NSTextAlignment.right
        label232.textAlignment = NSTextAlignment.right
        label233.textAlignment = NSTextAlignment.right
        label242.textAlignment = NSTextAlignment.right
        label243.textAlignment = NSTextAlignment.right
        label252.textAlignment = NSTextAlignment.right
        label253.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        label201.text = "多く払う人"
        label202.text = draft2[1]
        label203.text = draft2[2]
        label211.text = "普通に払う人"
        label212.text = draft2[3]
        label213.text = draft2[4]
        label221.text = "少なく払う人"
        label222.text = draft2[5]
        label223.text = draft2[6]
        label232.text = "合計"
        label233.text = draft2[8]
        label242.text = "支払額"
        label243.text = draft2[7]
        label252.text = "余り"
        label253.text = draft2[9]
        
        //テキストの追加
        vc2.view.addSubview(label201)
        vc2.view.addSubview(label202)
        vc2.view.addSubview(label203)
        vc2.view.addSubview(label211)
        vc2.view.addSubview(label212)
        vc2.view.addSubview(label213)
        vc2.view.addSubview(label221)
        vc2.view.addSubview(label222)
        vc2.view.addSubview(label223)
        vc2.view.addSubview(label232)
        vc2.view.addSubview(label233)
        vc2.view.addSubview(label242)
        vc2.view.addSubview(label243)
        vc2.view.addSubview(label252)
        vc2.view.addSubview(label253)
        
        
        
        //案3画面の生成
        let vc3 = UIViewController()
        let label301 = UILabel(frame: CGRect(x: 20, y: 120, width: screenWidth-30, height: 30))
        let label302 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-170, height: 30))
        let label303 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-30, height: 30))
        let label311 = UILabel(frame: CGRect(x: 20, y: 170, width: screenWidth-30, height: 30))
        let label312 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-170, height: 30))
        let label313 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-30, height: 30))
        let label321 = UILabel(frame: CGRect(x: 20, y: 220, width: screenWidth-30, height: 30))
        let label322 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-170, height: 30))
        let label323 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-30, height: 30))
        let label332 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-170, height: 30))
        let label333 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-30, height: 30))
        let label342 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-170, height: 30))
        let label343 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label352 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-170, height: 30))
        let label353 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-30, height: 30))
        label301.textAlignment = NSTextAlignment.left
        label302.textAlignment = NSTextAlignment.right
        label303.textAlignment = NSTextAlignment.right
        label311.textAlignment = NSTextAlignment.left
        label312.textAlignment = NSTextAlignment.right
        label313.textAlignment = NSTextAlignment.right
        label321.textAlignment = NSTextAlignment.left
        label322.textAlignment = NSTextAlignment.right
        label323.textAlignment = NSTextAlignment.right
        label332.textAlignment = NSTextAlignment.right
        label333.textAlignment = NSTextAlignment.right
        label342.textAlignment = NSTextAlignment.right
        label343.textAlignment = NSTextAlignment.right
        label352.textAlignment = NSTextAlignment.right
        label353.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        label301.text = "多く払う人"
        label302.text = draft3[1]
        label303.text = draft3[2]
        label311.text = "普通に払う人"
        label312.text = draft3[3]
        label313.text = draft3[4]
        label321.text = "少なく払う人"
        label322.text = draft3[5]
        label323.text = draft3[6]
        label332.text = "合計"
        label333.text = draft3[8]
        label342.text = "支払額"
        label343.text = draft3[7]
        label352.text = "余り"
        label353.text = draft3[9]
        
        //テキストの追加
        vc3.view.addSubview(label301)
        vc3.view.addSubview(label302)
        vc3.view.addSubview(label303)
        vc3.view.addSubview(label311)
        vc3.view.addSubview(label312)
        vc3.view.addSubview(label313)
        vc3.view.addSubview(label321)
        vc3.view.addSubview(label322)
        vc3.view.addSubview(label323)
        vc3.view.addSubview(label332)
        vc3.view.addSubview(label333)
        vc3.view.addSubview(label342)
        vc3.view.addSubview(label343)
        vc3.view.addSubview(label352)
        vc3.view.addSubview(label353)
        
        
        //案4画面の生成
        let vc4 = UIViewController()
        let label401 = UILabel(frame: CGRect(x: 20, y: 120, width: screenWidth-30, height: 30))
        let label402 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-170, height: 30))
        let label403 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-30, height: 30))
        let label411 = UILabel(frame: CGRect(x: 20, y: 170, width: screenWidth-30, height: 30))
        let label412 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-170, height: 30))
        let label413 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-30, height: 30))
        let label421 = UILabel(frame: CGRect(x: 20, y: 220, width: screenWidth-30, height: 30))
        let label422 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-170, height: 30))
        let label423 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-30, height: 30))
        let label432 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-170, height: 30))
        let label433 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-30, height: 30))
        let label442 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-170, height: 30))
        let label443 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label452 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-170, height: 30))
        let label453 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-30, height: 30))
        label401.textAlignment = NSTextAlignment.left
        label402.textAlignment = NSTextAlignment.right
        label403.textAlignment = NSTextAlignment.right
        label411.textAlignment = NSTextAlignment.left
        label412.textAlignment = NSTextAlignment.right
        label413.textAlignment = NSTextAlignment.right
        label421.textAlignment = NSTextAlignment.left
        label422.textAlignment = NSTextAlignment.right
        label423.textAlignment = NSTextAlignment.right
        label432.textAlignment = NSTextAlignment.right
        label433.textAlignment = NSTextAlignment.right
        label442.textAlignment = NSTextAlignment.right
        label443.textAlignment = NSTextAlignment.right
        label452.textAlignment = NSTextAlignment.right
        label453.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        label401.text = "多く払う人"
        label402.text = draft4[1]
        label403.text = draft4[2]
        label411.text = "普通に払う人"
        label412.text = draft4[3]
        label413.text = draft4[4]
        label421.text = "少なく払う人"
        label422.text = draft4[5]
        label423.text = draft4[6]
        label432.text = "合計"
        label433.text = draft4[8]
        label442.text = "支払額"
        label443.text = draft4[7]
        label452.text = "余り"
        label453.text = draft4[9]
        
        //テキストの追加
        vc4.view.addSubview(label401)
        vc4.view.addSubview(label402)
        vc4.view.addSubview(label403)
        vc4.view.addSubview(label411)
        vc4.view.addSubview(label412)
        vc4.view.addSubview(label413)
        vc4.view.addSubview(label421)
        vc4.view.addSubview(label422)
        vc4.view.addSubview(label423)
        vc4.view.addSubview(label432)
        vc4.view.addSubview(label433)
        vc4.view.addSubview(label442)
        vc4.view.addSubview(label443)
        vc4.view.addSubview(label452)
        vc4.view.addSubview(label453)
        
        
        //案5画面の生成
        let vc5 = UIViewController()
        let label501 = UILabel(frame: CGRect(x: 20, y: 120, width: screenWidth-30, height: 30))
        let label502 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-170, height: 30))
        let label503 = UILabel(frame: CGRect(x: 0, y: 120, width: screenWidth-30, height: 30))
        let label511 = UILabel(frame: CGRect(x: 20, y: 170, width: screenWidth-30, height: 30))
        let label512 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-170, height: 30))
        let label513 = UILabel(frame: CGRect(x: 0, y: 170, width: screenWidth-30, height: 30))
        let label521 = UILabel(frame: CGRect(x: 20, y: 220, width: screenWidth-30, height: 30))
        let label522 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-170, height: 30))
        let label523 = UILabel(frame: CGRect(x: 0, y: 220, width: screenWidth-30, height: 30))
        let label532 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-170, height: 30))
        let label533 = UILabel(frame: CGRect(x: 0, y: 280, width: screenWidth-30, height: 30))
        let label542 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-170, height: 30))
        let label543 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label552 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-170, height: 30))
        let label553 = UILabel(frame: CGRect(x: 0, y: 380, width: screenWidth-30, height: 30))
        //label101.textColor = UIColor.blue
        label501.textAlignment = NSTextAlignment.left
        label502.textAlignment = NSTextAlignment.right
        label503.textAlignment = NSTextAlignment.right
        label511.textAlignment = NSTextAlignment.left
        label512.textAlignment = NSTextAlignment.right
        label513.textAlignment = NSTextAlignment.right
        label521.textAlignment = NSTextAlignment.left
        label522.textAlignment = NSTextAlignment.right
        label523.textAlignment = NSTextAlignment.right
        label532.textAlignment = NSTextAlignment.right
        label533.textAlignment = NSTextAlignment.right
        label542.textAlignment = NSTextAlignment.right
        label543.textAlignment = NSTextAlignment.right
        label552.textAlignment = NSTextAlignment.right
        label553.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        label501.text = "多く払う人"
        label502.text = draft5[1]
        label503.text = draft5[2]
        label511.text = "普通に払う人"
        label512.text = draft5[3]
        label513.text = draft5[4]
        label521.text = "少なく払う人"
        label522.text = draft5[5]
        label523.text = draft5[6]
        label532.text = "合計"
        label533.text = draft5[8]
        label542.text = "支払額"
        label543.text = draft5[7]
        label552.text = "余り"
        label553.text = draft5[9]
        
        //テキストの追加
        vc5.view.addSubview(label501)
        vc5.view.addSubview(label502)
        vc5.view.addSubview(label503)
        vc5.view.addSubview(label511)
        vc5.view.addSubview(label512)
        vc5.view.addSubview(label513)
        vc5.view.addSubview(label521)
        vc5.view.addSubview(label522)
        vc5.view.addSubview(label523)
        vc5.view.addSubview(label532)
        vc5.view.addSubview(label533)
        vc5.view.addSubview(label542)
        vc5.view.addSubview(label543)
        vc5.view.addSubview(label552)
        vc5.view.addSubview(label553)
        

        
        //タブビューの生成
        let tc = TabPageViewController.create()
        // タブに表示するタイトル
        if numDraft == 1 {
            tc.tabItems = [(vc1, "案1")]
        } else if numDraft == 2 {
            tc.tabItems = [(vc1, "案1"),(vc2, "案2")]
        } else if numDraft == 3 {
            tc.tabItems = [(vc1, "案1"),(vc2, "案2"),(vc3, "案3")]
            tc.isInfinity = true
        } else if numDraft == 4 {
            tc.tabItems = [(vc1, "案1"),(vc2, "案2"),(vc3, "案3"),(vc4, "案4")]
            tc.isInfinity = true
        } else if numDraft == 5 {
            tc.tabItems = [(vc1, "案1"),(vc2, "案2"),(vc3, "案3"),(vc4, "案4"),(vc5, "案5")]
            tc.isInfinity = true
        }
        
        
        self.addChildViewController(tc)
        self.view.addSubview(tc.view)
        var option = TabPageOption()
        // 選択されたタブの文字&バーの色
        option.currentColor = #colorLiteral(red: 0.2980392157, green: 0.8196078431, blue: 0.7058823529, alpha: 1)
        tc.option = option
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

