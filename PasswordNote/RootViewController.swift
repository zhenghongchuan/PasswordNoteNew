//
//  RootViewController.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/19.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.33, green:0.69, blue:0.97, alpha:1.00)
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
        if (self.navigationController?.viewControllers.count)! >= 2{
            let backItem = UIBarButtonItem.init(image: UIImage.init(named: "backItem"), style: .plain, target: self, action: #selector(self.popVC))
            self.navigationItem.leftBarButtonItem = backItem;
        }
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
