//
//  ViewController.swift
//  SwiftProject
//
//  Created by cyf on 2019/1/2.
//  Copyright © 2019 cyf. All rights reserved.
//

import UIKit

let YFScreenWidth = Double(UIScreen.main.bounds.size.width)
let YFScreenHeight = Double(UIScreen.main.bounds.size.height)
let iPhoneX = (YFScreenWidth > 812 ? true : false )
let YFNavigationBarHeight = 44.0
let YFStatusBarHeight = (iPhoneX ? 44.0 : 20.0)
let YFMaxNavigationBarHeight = Double(YFNavigationBarHeight + YFStatusBarHeight)
let YFSafeLayoutHeight = iPhoneX ? 34.0 : 0.0
let YFTabBarHeight = iPhoneX ? 83.0 : 49.0

class ViewController: UIViewController {
    
    let navigationArray = ["QQ","WeChar","网易","支付宝","今日头条","抖音"]
    
    var viewControllerArrays = [UIViewController]()
    var btnArrays = [UIButton]()

    let sv = UIScrollView()
    let btnSrolloview = UIScrollView()
    let sepLine = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        setupNavigationBtn()
        setupScrollView()
        
       
    }
    
    func setupNavigationBtn(){
        
       print("self.view.frame.size.width = ",self.view.frame.size.width)
        //计算按钮的宽度
        let btnWidth = CGFloat(YFScreenWidth/5)
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        var navigationBarHeight: CGFloat = CGFloat()
        if let navigationController = self.navigationController{
            navigationBarHeight = navigationController.navigationBar.frame.height
        }else {
            navigationBarHeight = 0
           
        }
        
        //创建导航标签滚动视图
        btnSrolloview.frame = CGRect(x: 0, y: statusBarHeight + navigationBarHeight, width: self.view.frame.size.width, height: 50)
        btnSrolloview.delegate = self
        btnSrolloview.backgroundColor = .white
        btnSrolloview.showsHorizontalScrollIndicator = false
        btnSrolloview.contentSize = CGSize(width: CGFloat(navigationArray.count) * btnWidth , height: 50)
        view.addSubview(btnSrolloview)
     
        //创建导航标签
        for i in 0...navigationArray.count - 1 {
            let btn = UIButton()
            btn.tag = i
            btn.setTitle(navigationArray[i], for: .normal)
            btn.setTitleColor(UIColor.orange, for: .normal)
            btn.frame  = CGRect(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height: 50)
            btn.addTarget(self, action: #selector(switchVc(btn:)), for: .touchUpInside)
            btnSrolloview.addSubview(btn)
            btnArrays.append(btn)
        }
        
        //分割线
        let bottomLine = UIView()
        bottomLine.frame = CGRect(x: 0, y: btnSrolloview.frame.height - CGFloat(1), width: btnSrolloview.frame.width, height: CGFloat(1))
        bottomLine.backgroundColor = UIColor(white: 0, alpha: 0.1)
        btnSrolloview.addSubview(bottomLine)
        
        //下划线
        sepLine.frame = CGRect(x: 0, y: btnSrolloview.frame.height - CGFloat(3), width: btnWidth, height: CGFloat(3))
        sepLine.backgroundColor = .orange
        btnSrolloview.addSubview(sepLine)

    }
    
    func setupScrollView() {
        
        //底部滚动视图
        sv.frame = CGRect(x: 0, y: btnSrolloview.frame.maxY + 50, width: self.view.frame.size.width, height: self.view.frame.size.height - btnSrolloview.frame.maxY)
        sv.delegate = self
        sv.bounces = false
        sv.backgroundColor = .white
        sv.isPagingEnabled = true
        sv.isScrollEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.contentSize =  CGSize(width:self.view.frame.size.width * CGFloat(navigationArray.count), height: self.view.frame.size.height - btnSrolloview.frame.size.height  - 50)
        
        self.view.addSubview(sv)
        
     
        //控制器
        for i in 0...navigationArray.count-1 {
            
            let vc = UIViewController()
            vc.view.frame = CGRect(x: CGFloat(i)  * self.view.frame.size.width, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            vc.view.backgroundColor = UIColor.white
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 30)
            label.text = navigationArray[i]
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.textColor = UIColor.orange
            label.textAlignment = .center
            vc.view.addSubview(label)
          
            //默认将第一个vc的根视图加载到sv上面
            sv.addSubview(vc.view)
            
            //保存vc
            viewControllerArrays.append(vc)
          
        }
    
      
    }
    
    @objc func switchVc(btn: UIButton) {
     
        let tag = btn.tag
        print("clicks tag = \(tag)")
    
        //移动下划线
        var frame = sepLine.frame
        frame.origin.x = btn.frame.origin.x
        //切换VC
        var offSetX = sv.contentOffset.x
        offSetX = CGFloat(tag) * self.view.frame.size.width
        //移动被屏幕遮住的标签
        var btnSvOffSetX = btnSrolloview.contentOffset.x
        if self.view.frame.size.width < btn.frame.maxX {
            btnSvOffSetX = -(self.view.frame.size.width - btn.frame.maxX)
        }else{
            btnSvOffSetX = 0.0
        }
        
        UIView.animate(withDuration: 0.25) {
           self.sepLine.frame = frame
           self.sv.contentOffset = CGPoint(x: offSetX, y: 0)
           self.btnSrolloview.contentOffset = CGPoint(x: btnSvOffSetX, y: 0)
        }
    
     
        
        
    }
  

}

extension ViewController: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == sv{
            print("scrollView.contentOffset \(scrollView.contentOffset) \(scrollView.frame.size.width)")
            let index = scrollView.contentOffset.x.truncatingRemainder(dividingBy: self.view.frame.size.width)
            print("index = \(index)")
            let btn = btnArrays[Int(index)]
            self.switchVc(btn: btn)
            
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        
    }
}
