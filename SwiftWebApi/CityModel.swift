//
//  CityModel.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/9.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import Foundation

struct City {
    var cityName:String = ""
    var cityKey:String = ""
    var cityWeather:String = ""
    var cityPY:String = ""
    
    init(key:NSString, name:NSString, weather:NSString){
        if( key == "") {
            ErrorMessageShow.ShareInstance.errorMessage = "城市拼音不能为空！"
            return
        }
        if( name == ""){
            ErrorMessageShow.ShareInstance.errorMessage = "城市名称不能为空！"
            return
        }
        cityKey = key
        cityPY = key
        cityName = name
        cityWeather = weather
    }
}