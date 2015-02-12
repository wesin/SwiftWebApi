//
//  ViewController.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/7.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKit

struct MainIdentifier {
    struct TableIndentifier {
        static let MainCell:String = "maincell"
    }
    struct PushIndentifier{
        static let NewCity:String = "newcity"
        static let NewDetail:String = "citydetail"
    }
}

class ViewController: UITableViewController, ListCityDelegate {
    
    @IBOutlet var cityTableView: UITableView!
    
    var listCity:ListCity?
    
//    private var cityDetaiController:CityDetailViewController?
//    private var cityAddController:NewCityViewController?
    private var currentCity = 0
    
//    let arrayCity = ["guangzhou","shanghai","hangzhou"]
//    var dicCity:[String:City] = ["guangzhou":City(key: "guangzhou", name: "广州", weather: ""), "shanghai":City(key: "shanghai", name: "上海", weather: ""),"hangzhou":City(key: "hangzhou", name: "杭州", weather: "")]
//    
    
//    let manager = AFHTTPRequestOperationManager()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listCity?.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        listCity?.addCity("shanghai", withName: "上海")
        listCity?.addCity("hangzhou", withName: "杭州")
    }
    //
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch(segue.identifier!) {
        case MainIdentifier.PushIndentifier.NewCity:
            let newCityController = segue.destinationViewController as NewCityViewController
            newCityController.listCity = listCity
            break
        case MainIdentifier.PushIndentifier.NewDetail:
            let cityDetailController = segue.destinationViewController as CityDetailViewController
            cityDetailController.city = listCity?.getCity(tableView.indexPathForSelectedRow()!.row)
        default:
            return
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCity?.cityLst.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MainIdentifier.TableIndentifier.MainCell,forIndexPath: indexPath)  as UITableViewCell
        let row = indexPath.row
        let city = listCity!.getCity(row)
        cell.textLabel?.text = city.cityName
        cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        cell.detailTextLabel?.text = city.cityPY
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentCity = indexPath.row
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        //        cityDetaiController.city = dicCity[arrayCity[indexPath.row]]!
        //        self.navigationController?.pushViewController(cityDetaiController, animated: true)
        let city = listCity!.getCity(indexPath.row)
        let alertView = UIAlertView()
        alertView.message = "hello " + city.cityName
        alertView.title = "Hello"
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        println("hehehaha")
    }

    
    //MARK:Protocol
    func reloadView() {
        self.cityTableView.reloadData()
    }
    
    //MARK: Private Method
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

