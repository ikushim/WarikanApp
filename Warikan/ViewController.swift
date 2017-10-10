//
//  ViewController.swift
//  Warikan
//
//  Created by nttr on 2017/09/27.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import TabPageViewController
import Accounts

class ViewController: UIViewController {
    var testNumber: Int = 0
    var numMoney: Int = 0
    var numGroupA: Int = 0
    var numGroupB: Int = 0
    var numGroupC: Int = 0
    var testAllay = ["test","test"]
    var draft1 = ["false","0","0","0","0","0","0","0","0","0","0","0","0"]
    var draft2 = ["false","0","0","0","0","0","0","0","0","0","0","0","0"]
    var draft3 = ["false","0","0","0","0","0","0","0","0","0","0","0","0"]
    var draft4 = ["false","0","0","0","0","0","0","0","0","0","0","0","0"]
    var draft5 = ["false","0","0","0","0","0","0","0","0","0","0","0","0"]
    var numDraft = 0
    private var myRightButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.navigationController?.navigationBar.isTranslucent = false
        //self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        //UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        //myRightButton = UIBarButtonItem(title: "RightBtn", style: .plain, target: self, action: "onClickMyButton:")
        //let imageAction = UIImage(named:"Action.png")!
        //myRightButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: "onClickMyButton")
        //self.navigationItem.rightBarButtonItem = myRightButton

        //静的枠の作成
        let screenWidth:CGFloat = view.frame.size.width
        let imageView1:UIImageView!
        let image1 = UIImage(named:"high.png")!
        imageView1 = UIImageView(image: image1)
        imageView1.frame = CGRect(x: 20, y: 120, width: 24, height: 24)
        
        let label101 = UILabel(frame: CGRect(x: 50, y: 116, width: screenWidth-50, height: 30))
        label101.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label101.textAlignment = NSTextAlignment.left
        label101.text = "多く払う人"
        
        let imageView2:UIImageView!
        let image2 = UIImage(named:"middle.png")!
        imageView2 = UIImageView(image: image2)
        imageView2.frame = CGRect(x: 20, y: 210, width: 24, height: 24)

        let label111 = UILabel(frame: CGRect(x: 50, y: 206, width: screenWidth-50, height: 30))
        label111.textAlignment = NSTextAlignment.left
        label111.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label111.text = "普通に払う人"


        let imageView3:UIImageView!
        let image3 = UIImage(named:"low.png")!
        imageView3 = UIImageView(image: image3)
        imageView3.frame = CGRect(x: 20, y: 300, width: 24, height: 24)
        
        let label121 = UILabel(frame: CGRect(x: 50, y: 296, width: screenWidth-50, height: 30))
        label121.textAlignment = NSTextAlignment.left
        label121.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label121.text = "少なく払う人"
        
        let imageView4:UIImageView!
        let image4 = UIImage(named:"total.png")!
        imageView4 = UIImageView(image: image4)
        imageView4.frame = CGRect(x: 150, y: 404, width: 24, height: 24)
        
        let label132 = UILabel(frame: CGRect(x: 180, y: 400, width: screenWidth-170, height: 30))
        label132.textAlignment = NSTextAlignment.left
        label132.text = "合計"
        label132.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView5:UIImageView!
        let image5 = UIImage(named:"money.png")!
        imageView5 = UIImageView(image: image5)
        imageView5.frame = CGRect(x: 150, y: 454, width: 24, height: 24)
        
        let label142 = UILabel(frame: CGRect(x: 180, y: 450, width: screenWidth-170, height: 30))
        label142.textAlignment = NSTextAlignment.left
        label142.text = "お支払額"
        label142.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView6:UIImageView!
        let image6 = UIImage(named:"remain.png")!
        imageView6 = UIImageView(image: image6)
        imageView6.frame = CGRect(x: 150, y: 504, width: 24, height: 24)
        
        let label152 = UILabel(frame: CGRect(x: 180, y: 500, width: screenWidth-170, height: 30))
        label152.textAlignment = NSTextAlignment.left
        label152.text = "余り"
        label152.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        
        
        
        //Plan A画面の生成
        let vc1 = UIViewController()
        //vc1.view.backgroundColor = UIColor.clear
        let myView1 = MyView(frame: view.bounds)
        myView1.backgroundColor = UIColor.clear
        vc1.view.addSubview(myView1)
        
        let label102 = UILabel(frame: CGRect(x: 30, y: 150, width: screenWidth-30, height: 30))
        let label103 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-180, height: 30))
        let label104 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-30, height: 30))
        let label112 = UILabel(frame: CGRect(x: 30, y: 240, width: screenWidth-30, height: 30))
        let label113 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-180, height: 30))
        let label114 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-30, height: 30))
        let label122 = UILabel(frame: CGRect(x: 30, y: 330, width: screenWidth-30, height: 30))
        let label123 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-180, height: 30))
        let label124 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label133 = UILabel(frame: CGRect(x: 0, y: 400, width: screenWidth-30, height: 30))
        let label143 = UILabel(frame: CGRect(x: 0, y: 450, width: screenWidth-30, height: 30))
        let label153 = UILabel(frame: CGRect(x: 0, y: 500, width: screenWidth-30, height: 30))
        
        label102.textAlignment = NSTextAlignment.left
        label103.textAlignment = NSTextAlignment.right
        label104.textAlignment = NSTextAlignment.right
        label112.textAlignment = NSTextAlignment.left
        label113.textAlignment = NSTextAlignment.right
        label114.textAlignment = NSTextAlignment.right
        label122.textAlignment = NSTextAlignment.left
        label123.textAlignment = NSTextAlignment.right
        label124.textAlignment = NSTextAlignment.right
        label133.textAlignment = NSTextAlignment.right
        label143.textAlignment = NSTextAlignment.right
        label153.textAlignment = NSTextAlignment.right

        //テキストの作成
        
        label102.text = draft1[2]
        label102.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label102.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label103.text = draft1[1]
        label104.text = "計：" + draft1[10]
        label112.text = draft1[4]
        label112.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label112.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label113.text = draft1[3]
        label114.text = "計：" + draft1[11]
        label122.text = draft1[6]
        label122.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label122.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label123.text = draft1[5]
        label124.text = "計：" + draft1[12]
        label133.text = draft1[8]
        label143.text = draft1[7]
        label153.text = draft1[9]
        
        //テキストの追加
        
        vc1.view.addSubview(label102)
        vc1.view.addSubview(label103)
        vc1.view.addSubview(label104)
        vc1.view.addSubview(label112)
        vc1.view.addSubview(label113)
        vc1.view.addSubview(label114)
        vc1.view.addSubview(label122)
        vc1.view.addSubview(label123)
        vc1.view.addSubview(label124)
        vc1.view.addSubview(label132)
        vc1.view.addSubview(label133)
        vc1.view.addSubview(label142)
        vc1.view.addSubview(label143)
        vc1.view.addSubview(label152)
        vc1.view.addSubview(label153)
        
        vc1.view.addSubview(imageView1)
        vc1.view.addSubview(label101)
        vc1.view.addSubview(imageView2)
        vc1.view.addSubview(label111)
        vc1.view.addSubview(imageView3)
        vc1.view.addSubview(label121)
        vc1.view.addSubview(imageView4)
        vc1.view.addSubview(imageView5)
        vc1.view.addSubview(imageView6)
        
        //Plan B画面の生成
        let vc2 = UIViewController()
        let myView2 = MyView(frame: view.bounds)
        myView2.backgroundColor = UIColor.white
        vc2.view.addSubview(myView2)
        
        let imageView21:UIImageView!
        imageView21 = UIImageView(image: image1)
        imageView21.frame = CGRect(x: 20, y: 120, width: 24, height: 24)
        
        let label201 = UILabel(frame: CGRect(x: 50, y: 116, width: screenWidth-50, height: 30))
        label201.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label201.textAlignment = NSTextAlignment.left
        label201.text = "多く払う人"
        
        let imageView22:UIImageView!
        imageView22 = UIImageView(image: image2)
        imageView22.frame = CGRect(x: 20, y: 210, width: 24, height: 24)
        
        let label211 = UILabel(frame: CGRect(x: 50, y: 206, width: screenWidth-50, height: 30))
        label211.textAlignment = NSTextAlignment.left
        label211.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label211.text = "普通に払う人"
        
        
        let imageView23:UIImageView!
        imageView23 = UIImageView(image: image3)
        imageView23.frame = CGRect(x: 20, y: 300, width: 24, height: 24)
        
        let label221 = UILabel(frame: CGRect(x: 50, y: 296, width: screenWidth-50, height: 30))
        label221.textAlignment = NSTextAlignment.left
        label221.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label221.text = "少なく払う人"
        
        let imageView24:UIImageView!
        imageView24 = UIImageView(image: image4)
        imageView24.frame = CGRect(x: 150, y: 404, width: 24, height: 24)
        
        let label232 = UILabel(frame: CGRect(x: 180, y: 400, width: screenWidth-170, height: 30))
        label232.textAlignment = NSTextAlignment.left
        label232.text = "合計"
        label232.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView25:UIImageView!
        imageView25 = UIImageView(image: image5)
        imageView25.frame = CGRect(x: 150, y: 454, width: 24, height: 24)
        
        let label242 = UILabel(frame: CGRect(x: 180, y: 450, width: screenWidth-170, height: 30))
        label242.textAlignment = NSTextAlignment.left
        label242.text = "お支払額"
        label242.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView26:UIImageView!
        imageView26 = UIImageView(image: image6)
        imageView26.frame = CGRect(x: 150, y: 504, width: 24, height: 24)
        
        let label252 = UILabel(frame: CGRect(x: 180, y: 500, width: screenWidth-170, height: 30))
        label252.textAlignment = NSTextAlignment.left
        label252.text = "余り"
        label252.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let label202 = UILabel(frame: CGRect(x: 30, y: 150, width: screenWidth-30, height: 30))
        let label203 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-180, height: 30))
        let label204 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-30, height: 30))
        let label212 = UILabel(frame: CGRect(x: 30, y: 240, width: screenWidth-30, height: 30))
        let label213 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-180, height: 30))
        let label214 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-30, height: 30))
        let label222 = UILabel(frame: CGRect(x: 30, y: 330, width: screenWidth-30, height: 30))
        let label223 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-180, height: 30))
        let label224 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label233 = UILabel(frame: CGRect(x: 0, y: 400, width: screenWidth-30, height: 30))
        let label243 = UILabel(frame: CGRect(x: 0, y: 450, width: screenWidth-30, height: 30))
        let label253 = UILabel(frame: CGRect(x: 0, y: 500, width: screenWidth-30, height: 30))
        
        label202.textAlignment = NSTextAlignment.left
        label203.textAlignment = NSTextAlignment.right
        label204.textAlignment = NSTextAlignment.right
        label212.textAlignment = NSTextAlignment.left
        label213.textAlignment = NSTextAlignment.right
        label214.textAlignment = NSTextAlignment.right
        label222.textAlignment = NSTextAlignment.left
        label223.textAlignment = NSTextAlignment.right
        label224.textAlignment = NSTextAlignment.right
        label233.textAlignment = NSTextAlignment.right
        label243.textAlignment = NSTextAlignment.right
        label253.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        
        label202.text = draft2[2]
        label202.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label202.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label203.text = draft2[1]
        label204.text = "計：" + draft2[10]
        label212.text = draft2[4]
        label212.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label212.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label213.text = draft2[3]
        label214.text = "計：" + draft2[11]
        label222.text = draft2[6]
        label222.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label222.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label223.text = draft2[5]
        label224.text = "計：" + draft2[12]
        label233.text = draft2[8]
        label243.text = draft2[7]
        label253.text = draft2[9]
        
        //テキストの追加
        
        vc2.view.addSubview(label202)
        vc2.view.addSubview(label203)
        vc2.view.addSubview(label204)
        vc2.view.addSubview(label212)
        vc2.view.addSubview(label213)
        vc2.view.addSubview(label214)
        vc2.view.addSubview(label222)
        vc2.view.addSubview(label223)
        vc2.view.addSubview(label224)
        vc2.view.addSubview(label233)
        vc2.view.addSubview(label243)
        vc2.view.addSubview(label253)
        
        vc2.view.addSubview(imageView21)
        vc2.view.addSubview(label201)
        vc2.view.addSubview(imageView22)
        vc2.view.addSubview(label211)
        vc2.view.addSubview(imageView23)
        vc2.view.addSubview(label221)
        vc2.view.addSubview(imageView24)
        vc2.view.addSubview(label232)
        vc2.view.addSubview(imageView25)
        vc2.view.addSubview(label242)
        vc2.view.addSubview(imageView26)
        vc2.view.addSubview(label252)
        
        //Plan C画面の生成
        let vc3 = UIViewController()
        let myView3 = MyView(frame: view.bounds)
        myView3.backgroundColor = UIColor.white
        vc3.view.addSubview(myView3)
        
        let imageView31:UIImageView!
        imageView31 = UIImageView(image: image1)
        imageView31.frame = CGRect(x: 20, y: 120, width: 24, height: 24)
        
        let label301 = UILabel(frame: CGRect(x: 50, y: 116, width: screenWidth-50, height: 30))
        label301.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label301.textAlignment = NSTextAlignment.left
        label301.text = "多く払う人"
        
        let imageView32:UIImageView!
        imageView32 = UIImageView(image: image2)
        imageView32.frame = CGRect(x: 20, y: 210, width: 24, height: 24)
        
        let label311 = UILabel(frame: CGRect(x: 50, y: 206, width: screenWidth-50, height: 30))
        label311.textAlignment = NSTextAlignment.left
        label311.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label311.text = "普通に払う人"
        
        
        let imageView33:UIImageView!
        imageView33 = UIImageView(image: image3)
        imageView33.frame = CGRect(x: 20, y: 300, width: 24, height: 24)
        
        let label321 = UILabel(frame: CGRect(x: 50, y: 296, width: screenWidth-50, height: 30))
        label321.textAlignment = NSTextAlignment.left
        label321.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label321.text = "少なく払う人"
        
        let imageView34:UIImageView!
        imageView34 = UIImageView(image: image4)
        imageView34.frame = CGRect(x: 150, y: 404, width: 24, height: 24)
        
        let label332 = UILabel(frame: CGRect(x: 180, y: 400, width: screenWidth-170, height: 30))
        label332.textAlignment = NSTextAlignment.left
        label332.text = "合計"
        label332.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView35:UIImageView!
        imageView35 = UIImageView(image: image5)
        imageView35.frame = CGRect(x: 150, y: 454, width: 24, height: 24)
        
        let label342 = UILabel(frame: CGRect(x: 180, y: 450, width: screenWidth-170, height: 30))
        label342.textAlignment = NSTextAlignment.left
        label342.text = "お支払額"
        label342.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView36:UIImageView!
        imageView36 = UIImageView(image: image6)
        imageView36.frame = CGRect(x: 150, y: 504, width: 24, height: 24)
        
        let label352 = UILabel(frame: CGRect(x: 180, y: 500, width: screenWidth-170, height: 30))
        label352.textAlignment = NSTextAlignment.left
        label352.text = "余り"
        label352.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let label302 = UILabel(frame: CGRect(x: 30, y: 150, width: screenWidth-30, height: 30))
        let label303 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-180, height: 30))
        let label304 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-30, height: 30))
        let label312 = UILabel(frame: CGRect(x: 30, y: 240, width: screenWidth-30, height: 30))
        let label313 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-180, height: 30))
        let label314 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-30, height: 30))
        let label322 = UILabel(frame: CGRect(x: 30, y: 330, width: screenWidth-30, height: 30))
        let label323 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-180, height: 30))
        let label324 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label333 = UILabel(frame: CGRect(x: 0, y: 400, width: screenWidth-30, height: 30))
        let label343 = UILabel(frame: CGRect(x: 0, y: 450, width: screenWidth-30, height: 30))
        let label353 = UILabel(frame: CGRect(x: 0, y: 500, width: screenWidth-30, height: 30))
        
        label302.textAlignment = NSTextAlignment.left
        label303.textAlignment = NSTextAlignment.right
        label304.textAlignment = NSTextAlignment.right
        label312.textAlignment = NSTextAlignment.left
        label313.textAlignment = NSTextAlignment.right
        label314.textAlignment = NSTextAlignment.right
        label322.textAlignment = NSTextAlignment.left
        label323.textAlignment = NSTextAlignment.right
        label324.textAlignment = NSTextAlignment.right
        label333.textAlignment = NSTextAlignment.right
        label343.textAlignment = NSTextAlignment.right
        label353.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        
        label302.text = draft3[2]
        label302.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label302.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label303.text = draft3[1]
        label304.text = "計：" + draft3[10]
        label312.text = draft3[4]
        label312.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label312.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label313.text = draft3[3]
        label314.text = "計：" + draft3[11]
        label322.text = draft3[6]
        label322.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label322.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label323.text = draft3[5]
        label324.text = "計：" + draft3[12]
        label333.text = draft3[8]
        label343.text = draft3[7]
        label353.text = draft3[9]
        
        //テキストの追加
        
        vc3.view.addSubview(label302)
        vc3.view.addSubview(label303)
        vc3.view.addSubview(label304)
        vc3.view.addSubview(label312)
        vc3.view.addSubview(label313)
        vc3.view.addSubview(label314)
        vc3.view.addSubview(label322)
        vc3.view.addSubview(label323)
        vc3.view.addSubview(label324)
        vc3.view.addSubview(label333)
        vc3.view.addSubview(label343)
        vc3.view.addSubview(label353)
        
        vc3.view.addSubview(imageView31)
        vc3.view.addSubview(label301)
        vc3.view.addSubview(imageView32)
        vc3.view.addSubview(label311)
        vc3.view.addSubview(imageView33)
        vc3.view.addSubview(label321)
        vc3.view.addSubview(imageView34)
        vc3.view.addSubview(label332)
        vc3.view.addSubview(imageView35)
        vc3.view.addSubview(label342)
        vc3.view.addSubview(imageView36)
        vc3.view.addSubview(label352)
        
        //Plan D画面の生成
        let vc4 = UIViewController()
        let myView4 = MyView(frame: view.bounds)
        myView4.backgroundColor = UIColor.white
        vc4.view.addSubview(myView4)
        
        let imageView41:UIImageView!
        imageView41 = UIImageView(image: image1)
        imageView41.frame = CGRect(x: 20, y: 120, width: 24, height: 24)
        
        let label401 = UILabel(frame: CGRect(x: 50, y: 116, width: screenWidth-50, height: 30))
        label401.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label401.textAlignment = NSTextAlignment.left
        label401.text = "多く払う人"
        
        let imageView42:UIImageView!
        imageView42 = UIImageView(image: image2)
        imageView42.frame = CGRect(x: 20, y: 210, width: 24, height: 24)
        
        let label411 = UILabel(frame: CGRect(x: 50, y: 206, width: screenWidth-50, height: 30))
        label411.textAlignment = NSTextAlignment.left
        label411.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label411.text = "普通に払う人"
        
        
        let imageView43:UIImageView!
        imageView43 = UIImageView(image: image3)
        imageView43.frame = CGRect(x: 20, y: 300, width: 24, height: 24)
        
        let label421 = UILabel(frame: CGRect(x: 50, y: 296, width: screenWidth-50, height: 30))
        label421.textAlignment = NSTextAlignment.left
        label421.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label421.text = "少なく払う人"
        
        let imageView44:UIImageView!
        imageView44 = UIImageView(image: image4)
        imageView44.frame = CGRect(x: 150, y: 404, width: 24, height: 24)
        
        let label432 = UILabel(frame: CGRect(x: 180, y: 400, width: screenWidth-170, height: 30))
        label432.textAlignment = NSTextAlignment.left
        label432.text = "合計"
        label432.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView45:UIImageView!
        imageView45 = UIImageView(image: image5)
        imageView45.frame = CGRect(x: 150, y: 454, width: 24, height: 24)
        
        let label442 = UILabel(frame: CGRect(x: 180, y: 450, width: screenWidth-170, height: 30))
        label442.textAlignment = NSTextAlignment.left
        label442.text = "お支払額"
        label442.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView46:UIImageView!
        imageView46 = UIImageView(image: image6)
        imageView46.frame = CGRect(x: 150, y: 504, width: 24, height: 24)
        
        let label452 = UILabel(frame: CGRect(x: 180, y: 500, width: screenWidth-170, height: 30))
        label452.textAlignment = NSTextAlignment.left
        label452.text = "余り"
        label452.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let label402 = UILabel(frame: CGRect(x: 30, y: 150, width: screenWidth-30, height: 30))
        let label403 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-180, height: 30))
        let label404 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-30, height: 30))
        let label412 = UILabel(frame: CGRect(x: 30, y: 240, width: screenWidth-30, height: 30))
        let label413 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-180, height: 30))
        let label414 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-30, height: 30))
        let label422 = UILabel(frame: CGRect(x: 30, y: 330, width: screenWidth-30, height: 30))
        let label423 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-180, height: 30))
        let label424 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label433 = UILabel(frame: CGRect(x: 0, y: 400, width: screenWidth-30, height: 30))
        let label443 = UILabel(frame: CGRect(x: 0, y: 450, width: screenWidth-30, height: 30))
        let label453 = UILabel(frame: CGRect(x: 0, y: 500, width: screenWidth-30, height: 30))
        
        label402.textAlignment = NSTextAlignment.left
        label403.textAlignment = NSTextAlignment.right
        label404.textAlignment = NSTextAlignment.right
        label412.textAlignment = NSTextAlignment.left
        label413.textAlignment = NSTextAlignment.right
        label414.textAlignment = NSTextAlignment.right
        label422.textAlignment = NSTextAlignment.left
        label423.textAlignment = NSTextAlignment.right
        label424.textAlignment = NSTextAlignment.right
        label433.textAlignment = NSTextAlignment.right
        label443.textAlignment = NSTextAlignment.right
        label453.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        
        label402.text = draft4[2]
        label402.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label402.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label403.text = draft4[1]
        label404.text = "計：" + draft4[10]
        label412.text = draft4[4]
        label412.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label412.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label413.text = draft4[3]
        label414.text = "計：" + draft4[11]
        label422.text = draft4[6]
        label422.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label422.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label423.text = draft4[5]
        label424.text = "計：" + draft4[12]
        label433.text = draft4[8]
        label443.text = draft4[7]
        label453.text = draft4[9]
        
        //テキストの追加
        
        vc4.view.addSubview(label402)
        vc4.view.addSubview(label403)
        vc4.view.addSubview(label404)
        vc4.view.addSubview(label412)
        vc4.view.addSubview(label413)
        vc4.view.addSubview(label414)
        vc4.view.addSubview(label422)
        vc4.view.addSubview(label423)
        vc4.view.addSubview(label424)
        vc4.view.addSubview(label433)
        vc4.view.addSubview(label443)
        vc4.view.addSubview(label453)
        
        vc4.view.addSubview(imageView41)
        vc4.view.addSubview(label401)
        vc4.view.addSubview(imageView42)
        vc4.view.addSubview(label411)
        vc4.view.addSubview(imageView43)
        vc4.view.addSubview(label421)
        vc4.view.addSubview(imageView44)
        vc4.view.addSubview(label432)
        vc4.view.addSubview(imageView45)
        vc4.view.addSubview(label442)
        vc4.view.addSubview(imageView46)
        vc4.view.addSubview(label452)
        
        
        //Plan E画面の生成
        let vc5 = UIViewController()
        let myView5 = MyView(frame: view.bounds)
        myView5.backgroundColor = UIColor.white
        vc5.view.addSubview(myView5)
        
        let imageView51:UIImageView!
        imageView51 = UIImageView(image: image1)
        imageView51.frame = CGRect(x: 20, y: 120, width: 24, height: 24)
        
        let label501 = UILabel(frame: CGRect(x: 50, y: 116, width: screenWidth-50, height: 30))
        label501.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label501.textAlignment = NSTextAlignment.left
        label501.text = "多く払う人"
        
        let imageView52:UIImageView!
        imageView52 = UIImageView(image: image2)
        imageView52.frame = CGRect(x: 20, y: 210, width: 24, height: 24)
        
        let label511 = UILabel(frame: CGRect(x: 50, y: 206, width: screenWidth-50, height: 30))
        label511.textAlignment = NSTextAlignment.left
        label511.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label511.text = "普通に払う人"
        
        
        let imageView53:UIImageView!
        imageView53 = UIImageView(image: image3)
        imageView53.frame = CGRect(x: 20, y: 300, width: 24, height: 24)
        
        let label521 = UILabel(frame: CGRect(x: 50, y: 296, width: screenWidth-50, height: 30))
        label521.textAlignment = NSTextAlignment.left
        label521.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        label521.text = "少なく払う人"
        
        let imageView54:UIImageView!
        imageView54 = UIImageView(image: image4)
        imageView54.frame = CGRect(x: 150, y: 404, width: 24, height: 24)
        
        let label532 = UILabel(frame: CGRect(x: 180, y: 400, width: screenWidth-170, height: 30))
        label532.textAlignment = NSTextAlignment.left
        label532.text = "合計"
        label532.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView55:UIImageView!
        imageView55 = UIImageView(image: image5)
        imageView55.frame = CGRect(x: 150, y: 454, width: 24, height: 24)
        
        let label542 = UILabel(frame: CGRect(x: 180, y: 450, width: screenWidth-170, height: 30))
        label542.textAlignment = NSTextAlignment.left
        label542.text = "お支払額"
        label542.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let imageView56:UIImageView!
        imageView56 = UIImageView(image: image6)
        imageView56.frame = CGRect(x: 150, y: 504, width: 24, height: 24)
        
        let label552 = UILabel(frame: CGRect(x: 180, y: 500, width: screenWidth-170, height: 30))
        label552.textAlignment = NSTextAlignment.left
        label552.text = "余り"
        label552.textColor = #colorLiteral(red: 0.4549019608, green: 0.4745098039, blue: 0.537254902, alpha: 1)
        
        let label502 = UILabel(frame: CGRect(x: 30, y: 150, width: screenWidth-30, height: 30))
        let label503 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-180, height: 30))
        let label504 = UILabel(frame: CGRect(x: 0, y: 150, width: screenWidth-30, height: 30))
        let label512 = UILabel(frame: CGRect(x: 30, y: 240, width: screenWidth-30, height: 30))
        let label513 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-180, height: 30))
        let label514 = UILabel(frame: CGRect(x: 0, y: 240, width: screenWidth-30, height: 30))
        let label522 = UILabel(frame: CGRect(x: 30, y: 330, width: screenWidth-30, height: 30))
        let label523 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-180, height: 30))
        let label524 = UILabel(frame: CGRect(x: 0, y: 330, width: screenWidth-30, height: 30))
        let label533 = UILabel(frame: CGRect(x: 0, y: 400, width: screenWidth-30, height: 30))
        let label543 = UILabel(frame: CGRect(x: 0, y: 450, width: screenWidth-30, height: 30))
        let label553 = UILabel(frame: CGRect(x: 0, y: 500, width: screenWidth-30, height: 30))
        
        label502.textAlignment = NSTextAlignment.left
        label503.textAlignment = NSTextAlignment.right
        label504.textAlignment = NSTextAlignment.right
        label512.textAlignment = NSTextAlignment.left
        label513.textAlignment = NSTextAlignment.right
        label514.textAlignment = NSTextAlignment.right
        label522.textAlignment = NSTextAlignment.left
        label523.textAlignment = NSTextAlignment.right
        label524.textAlignment = NSTextAlignment.right
        label533.textAlignment = NSTextAlignment.right
        label543.textAlignment = NSTextAlignment.right
        label553.textAlignment = NSTextAlignment.right
        
        //テキストの作成
        
        label502.text = draft5[2]
        label502.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label502.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label503.text = draft5[1]
        label504.text = "計：" + draft5[10]
        label512.text = draft5[4]
        label512.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label512.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label513.text = draft5[3]
        label514.text = "計：" + draft5[11]
        label522.text = draft5[6]
        label522.textColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.5294117647, alpha: 1)
        label522.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label523.text = draft5[5]
        label524.text = "計：" + draft5[12]
        label533.text = draft5[8]
        label543.text = draft5[7]
        label553.text = draft5[9]
        
        //テキストの追加
        
        vc5.view.addSubview(label502)
        vc5.view.addSubview(label503)
        vc5.view.addSubview(label504)
        vc5.view.addSubview(label512)
        vc5.view.addSubview(label513)
        vc5.view.addSubview(label514)
        vc5.view.addSubview(label522)
        vc5.view.addSubview(label523)
        vc5.view.addSubview(label524)
        vc5.view.addSubview(label533)
        vc5.view.addSubview(label543)
        vc5.view.addSubview(label553)
        
        vc5.view.addSubview(imageView51)
        vc5.view.addSubview(label501)
        vc5.view.addSubview(imageView52)
        vc5.view.addSubview(label511)
        vc5.view.addSubview(imageView53)
        vc5.view.addSubview(label521)
        vc5.view.addSubview(imageView54)
        vc5.view.addSubview(label532)
        vc5.view.addSubview(imageView55)
        vc5.view.addSubview(label542)
        vc5.view.addSubview(imageView56)
        vc5.view.addSubview(label552)
        
        

        
        //タブビューの生成
        let tc = TabPageViewController.create()
        
        tc.option.tabBackgroundColor = UIColor.white
        tc.option.currentColor = UIColor.black
        tc.option.defaultColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tc.option.pageBackgoundColor = UIColor.white
        
        // タブに表示するタイトル
        if numDraft == 1 {
            tc.tabItems = [(vc1, "Plan A")]
            tc.option.tabWidth = 375
            
        } else if numDraft == 2 {
            tc.tabItems = [(vc1, "Plan A"),(vc2, "Plan B")]
            tc.option.tabWidth = 187.5
        } else if numDraft == 3 {
            tc.tabItems = [(vc1, "Plan A"),(vc2, "Plan B"),(vc3, "Plan C")]
            tc.isInfinity = true
        } else if numDraft == 4 {
            tc.tabItems = [(vc1, "Plan A"),(vc2, "Plan B"),(vc3, "Plan C"),(vc4, "Plan D")]
            tc.isInfinity = true
        } else if numDraft == 5 {
            tc.tabItems = [(vc1, "Plan A"),(vc2, "Plan B"),(vc3, "Plan C"),(vc4, "Plan D"),(vc5, "Plan E")]
            tc.isInfinity = true
        }
        
        //vc1.view.backgroundColor = UIColor.clear
        self.addChildViewController(tc)
        self.view.addSubview(tc.view)
        
        
        
        
        
        
        
        
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

class MyView: UIView {
    override func draw(_ rect: CGRect) {

        UIColor.lightGray.setStroke() // 色をセット
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 25, y: 180))
        path1.addLine(to: CGPoint(x: 350, y: 180))
        path1.lineWidth = 0.2 // 線の太さ
        path1.stroke()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 25, y: 270))
        path2.addLine(to: CGPoint(x: 350, y: 270))
        path2.lineWidth = 0.2 // 線の太さ
        path2.stroke()
        
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 25, y: 360))
        path3.addLine(to: CGPoint(x: 350, y: 360))
        path3.lineWidth = 0.2 // 線の太さ
        path3.stroke()
        
        let path4 = UIBezierPath()
        path4.move(to: CGPoint(x: 145, y: 430))
        path4.addLine(to: CGPoint(x: 350, y: 430))
        path4.lineWidth = 0.2 // 線の太さ
        path4.stroke()
        
        let path5 = UIBezierPath()
        path5.move(to: CGPoint(x: 145, y: 480))
        path5.addLine(to: CGPoint(x: 350, y: 480))
        path5.lineWidth = 0.2 // 線の太さ
        path5.stroke()
        
        let path6 = UIBezierPath()
        path6.move(to: CGPoint(x: 145, y: 530))
        path6.addLine(to: CGPoint(x: 350, y: 530))
        path6.lineWidth = 0.2 // 線の太さ
        path6.stroke()
    }
    
    internal func onClickMyButton(sender: UIButton){
        let shareText = "Apple - Apple Watch"
        let activityItems = [shareText]
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityType.postToFacebook,
            UIActivityType.postToTwitter,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        let vc6 = UIViewController()
        vc6.present(activityVC, animated: true, completion: nil)
        
    }
}

