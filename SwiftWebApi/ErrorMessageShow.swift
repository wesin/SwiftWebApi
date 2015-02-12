//
//  ErrorMessageShow.swift
//  SwiftWebApi
//
//  Created by 何文新 on 15/2/11.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKit

class ErrorMessageShow {
    
    let pAlertView = UIAlertView()
    
    //    class var alertView : UIAlertView {
    //        return pAlertView
    //    }
    //
    var errorMessage :String = "" {
        didSet (newValue) {
            let queue:dispatch_queue_t = dispatch_get_main_queue()
            dispatch_async(queue, {
                self.pAlertView.title = "Error"
                self.pAlertView.message = newValue
                self.pAlertView.addButtonWithTitle("OK")
                self.pAlertView.show()
            })
        }
    }
    
    class var ShareInstance: ErrorMessageShow {
        struct Static {
            static let instance : ErrorMessageShow = ErrorMessageShow()
        }
        return Static.instance
    }
    
    
}