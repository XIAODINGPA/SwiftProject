//
//  ExampleViewController.swift
//  SwiftProject
//
//  Created by cyf on 2019/1/4.
//  Copyright © 2019 cyf. All rights reserved.
//

import UIKit

class ExampleViewController: UITableViewController {
    
    struct ExampleItem {
        var image: UIImage?
        var title = "标题"
        var des = "详情"
        var classIdentifier = "UIViewController"
    }
    
    var dataSource = [ExampleItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SwiftProject"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
        tableView.rowHeight = 50
        
        dataSource = addExampleItems()
    }
   
    //MARK: - 配置数据
   fileprivate func addExampleItems() -> [ExampleItem] {
        let pageItem = ExampleItem(image: nil, title: "PageViewController", des: "分页控件", classIdentifier: "BottomLineViewController")
        return [pageItem]
    }

  

}

//MARK: - 数据源 & 代理
extension ExampleViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = dataSource[indexPath.row]
        let exampleCell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell")
        exampleCell?.textLabel?.text = item.title
        exampleCell?.detailTextLabel?.text = item.des
        return exampleCell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let viewController = BottomLineViewController()
        self.present(viewController, animated: true, completion: nil)
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

