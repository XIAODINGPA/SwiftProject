//
//  BottomLineViewController.swift
//  SwiftProject
//
//  Created by cyf on 2019/1/4.
//  Copyright © 2019 cyf. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class BottomLineViewController: ButtonBarPagerTabStripViewController{
    

    override func viewDidLoad() {
        
    
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .orange
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarMinimumInteritemSpacing = 0
        settings.style.buttonBarMinimumLineSpacing = 0

        navigationController?.navigationBar.isTranslucent = false
        super.viewDidLoad()
    


        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = .orange
        }

       
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let firstVc = PageSubViewController(indicatorInfo: IndicatorInfo(title: "第一页"))
        let secondeVc = PageSubViewController(indicatorInfo: IndicatorInfo(title: "第二页"))
        let thirdVc = PageSubViewController(indicatorInfo: IndicatorInfo(title: "第三页"))
        firstVc.view.backgroundColor = UIColor.orange
        secondeVc.view.backgroundColor = UIColor.red
        thirdVc.view.backgroundColor = UIColor.lightGray
        return [firstVc,secondeVc,thirdVc]
    }
    
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 

}

/**
extension BottomLineViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "第\(indexPath.row)行"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        header.addSubview(buttonBarView)
        header.backgroundColor = UIColor.red
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
**/
