//
//  CityDetailViewController.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/9.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKIT

class CityDetailViewController: UITableViewController {
        
//    var cityIndex:Int = 0
    
    var city:City?
    
    let identifier = "citydetailcell"
    
    override func viewDidLoad() {
        self.title = city?.cityName
//        self.tableView.registerClass(CityDetailCell.self, forCellReuseIdentifier: identifier)
        let rightBtn = UIBarButtonItem(title: "学妹", style: UIBarButtonItemStyle.Plain, target: self, action: "loveClick:")
        self.navigationController?.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func loveClick() {
        println("I love jiali")
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
//
//        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
//        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        switch(indexPath.row)
        {
        case 0:
            cell.textLabel?.text = "拼音"
            cell.detailTextLabel?.text = city?.cityKey
            break
        case 1:
            cell.textLabel?.text = "名称"
            cell.detailTextLabel?.text = city?.cityName
            break
        case 2:
            cell.textLabel?.text = "天气"
            cell.detailTextLabel?.text = city?.cityWeather
            break
        default:
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
        }
        return cell
    }
}
