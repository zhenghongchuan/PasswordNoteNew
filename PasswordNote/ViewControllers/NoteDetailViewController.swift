//
//  NoteDetailViewController.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/8/2.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit
import SnapKit

class NoteDetailViewController: RootViewController {
    
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordOneLabel: UILabel!
    @IBOutlet weak var passwordTwoView: UIView!
    @IBOutlet weak var passwordTwoLabel: UILabel!
    
    var data: NoteModel? {
        didSet {
            self.title = self.data?.noteName
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if self.data?.mark != "" {
            markLabel.text = String("备注:\(self.data?.mark ?? "")")
        }
        userNameLabel.text = self.data?.userName
        passwordOneLabel.text = self.data?.passwordList.first?.password
        if self.data?.passwordList[1].password == "" {
            passwordTwoView.isHidden = true
        }else {
            passwordTwoLabel.text = self.data?.passwordList[1].password
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
