//
//  NewCityViewController.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/11.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKit

class NewCityViewController: UIViewController {
    
    var listCity:ListCity?
    
    @IBOutlet var txtPinyin: UITextField!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        let rightBtn = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Bordered, target: self, action: "save:")
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let cityKey = txtPinyin.text
        let cityName = txtName.text
        listCity?.addCity(cityKey, withName: cityName)
    }
}
