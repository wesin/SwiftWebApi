//
//  ViewController.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/7.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let arrayCity = ["guangzhou","shanghai","hangzhou"]
    let dicCity:[String:City] = ["guangzhou":City(key: "guangzhou", name: "广州", weather: ""), "shanghai":City(key: "shanghai", name: "上海", weather: ""),"hangzhou":City(key: "hangzhou", name: "杭州", weather: "")]
    
    
    let manager = AFHTTPRequestOperationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = "http://api.openweathermap.org/data/2.5/weather"
        
        
        for (key,value) in dicCity {
            
            let params = ["q":key]
            manager.GET(url, parameters: params, success:
                {
                    (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                    println(responseObject.description)
                    let json = JSON(responseObject)
                    let weather = json["weather"][0]["main"].string!
                    var city = self.dicCity[key]!
                    city.cityWeather = weather
                    println(key + "'s weather : " + json["weather"][0]["main"].string!)
                    
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in println("Error:" + error.localizedDescription)})
            
        }
    }
    //
    func requestUrl(urlString: String){
        var url: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            
            if (error? != nil) {
                println("hehe")
                //Handle Error here
            }else{
                
                let json = JSON(data:data)
                
                let weather:JSON = json["weather"][0]["main"]
                self.textView.text = "guangzhou:" + weather.string!
                //Handle data in NSData type
                
                
            }
            
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dicCity.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("maincell", forIndexPath: indexPath)  as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = dicCity[arrayCity[row]]?.cityName
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        cell.detailTextLabel?.text = dicCity[arrayCity[row]]?.cityWeather
        
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let alertView = UIAlertView()
        alertView.message = "hello " + dicCity[arrayCity[indexPath.row]]!.cityName
        alertView.title = "Hello"
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        println("hehehaha")
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

