//
//  ListCity.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/11.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import Foundation

@objc public protocol ListCityDelegate {
    //重新刷新界面
     func reloadView()
}

public class ListCity {
    
    private var arrayCity:[String] = [String]()
    private var dicCity:[String:City] = [String:City]()
    
    private let manager = AFHTTPRequestOperationManager()
    private let url = "http://api.openweathermap.org/data/2.5/weather"
    
    init() {
        
    }
    
    //MARK:Public Method --
    public weak var delegate:ListCityDelegate?
    
    var cityLst:[String] {
        get {
            return arrayCity
        }
    }
    
    var cityDic:[String:City] {
        get {
            return dicCity
        }
    }
    
    //MARK:ADD
    func addCity(city:City){
        if isExitCity(city) {
            ErrorMessageShow.ShareInstance.errorMessage = "已存在City：" + city.cityName
            return
        }
        arrayCity.append(city.cityKey)
        dicCity[city.cityKey] = city
        getWeather(city)
        reloadView()
    }
    
    func addCity(cityPY:String, withName cityName:String){
        let city = City(key: cityPY, name: cityName, weather: "")
        addCity(city)
    }
    
    func addCity(city:City, atIndex index:Int) {
        if isExitCity(city) {
            ErrorMessageShow.ShareInstance.errorMessage = "已存在City：" + city.cityName
            return
        }
        arrayCity.insert(city.cityKey, atIndex: index)
        dicCity[city.cityKey] = city
        getWeather(city)
        reloadView()
    }
    
    //MARK:Search
    func isExitCity(city:City) -> Bool{
//        let filterArray = self.arrayCity.filter({ (t) -> Bool in return t == city.cityKey})
        
//        if filterArray.count > 0 {
//            return true
//        }
        if dicCity[city.cityKey] != nil {
            return true
        }
        return false
    }
    
    func getCity(index:Int) -> City{
        let cityKey = arrayCity[index]
        return dicCity[cityKey]!
    }
    
    //MARK:Delete
    func remove(city:City){
        
        if isExitCity(city) {
            var index:Int = -1
            var i :Int = 0
            arrayCity.map({
                (t) -> Void in
                if(t == city.cityKey) {
                    index = i
                }
                ++i
            })
            arrayCity.removeAtIndex(index)
            dicCity.removeValueForKey(city.cityKey)
            reloadView()
        }
    }
    
    
    //MARK:Private Method --
    func getWeather(city:City) {
        
        let params = ["q":city.cityPY]
        manager.GET(url, parameters: params, success:{
            (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
            
            println(responseObject.description)
            let json = JSON(responseObject)
            let weather = json["weather"][0]["main"].string!
            let cityTmp:City = City(key: city.cityKey, name: city.cityName, weather: weather)
            self.dicCity[city.cityKey] = cityTmp
            //这种方式是行不通的
            //(self.dicCity[citykey]).cityWeather = weather
            
            println(city.cityName + "'s weather : " + json["weather"][0]["main"].string!)
            
            }, failure:{
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                
                println("Error:" + error.localizedDescription)
        })

    }
    
    private func reloadView(){
        delegate?.reloadView()
    }
    
}