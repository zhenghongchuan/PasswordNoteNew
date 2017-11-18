//
//  ViewController.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/3.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit
import LocalAuthentication

@available(iOS 9.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.touchID()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @available(iOS 9.0, *)
    func touchID() {
        //创建上下文
        let context = LAContext()
        var error : NSError?
        //判断设备是否支持指纹识别
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            //开始指纹识别
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请用指纹解锁", reply: { (success, error) in
                if success {
                    debugPrint("successful")
                    //do what you want
                }else
                {
                    if let error = error as NSError?
                    {
                            switch error.code {
                            case LAError.appCancel.rawValue:
                                debugPrint("Authentication was cancelled by application")
                                
                            case LAError.authenticationFailed.rawValue:
                                debugPrint("The user failed to provide valid credentials")
                                
                            case LAError.invalidContext.rawValue:
                                debugPrint("The context is invalid")
                                
                            case LAError.passcodeNotSet.rawValue:
                                debugPrint("Passcode is not set on the device")
                                
                            case LAError.systemCancel.rawValue:
                                debugPrint("Authentication was cancelled by the system")
                                
                            case LAError.touchIDLockout.rawValue:
                                debugPrint("Too many failed attempts.")
                                
                            case LAError.touchIDNotAvailable.rawValue:
                                debugPrint("TouchID is not available on the device")
                                
                            case LAError.userCancel.rawValue:
                                debugPrint("The user did cancel")
                                
                            case LAError.userFallback.rawValue:
                                debugPrint("The user chose to use the fallback")
                                
                            default:
                                debugPrint( "Did not find error code on LAError object")
                            }
                    }
                }
            })
        }else
        {
            debugPrint("no support")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

