//
//  PageSubViewController.swift
//  SwiftProject
//
//  Created by cyf on 2019/1/4.
//  Copyright © 2019 cyf. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class PageSubViewController: UIViewController, IndicatorInfoProvider{
    
    var indicatorInfo: IndicatorInfo = IndicatorInfo(title: "标题")
    
//    init(style: UITableView.Style, indicatorInfo: IndicatorInfo) {
//        self.indicatorInfo = indicatorInfo
//        super.init(style: style)
//    }
    
    init(indicatorInfo: IndicatorInfo) {
        self.indicatorInfo = indicatorInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo{
        
        return indicatorInfo
    }

}
