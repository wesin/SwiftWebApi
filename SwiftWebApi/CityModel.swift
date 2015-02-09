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
    
    init(key:NSString, name:NSString, weather:NSString){
        cityKey = key
        cityName = name
        cityWeather = weather
    }
}