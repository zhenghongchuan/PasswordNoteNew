//
//  CreateNoteViewController.swift
//  PasswordNote
//
//  Created by 郑鸿川 on 2017/7/21.
//  Copyright © 2017年 郑鸿川. All rights reserved.
//

import UIKit
import RealmSwift
import PopupDialog
import PKHUD

class CreateNoteViewController: RootViewController, UITextFieldDelegate {

    @IBOutlet weak var noteNameTextField: UITextField!
    
    @IBOutlet weak var userNameBGView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordBGView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordTwoBGView: UIView!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    
    @IBOutlet weak var markBGView: UIView!
    @IBOutlet weak var markTextField: UITextField!
    
    @IBOutlet weak var confirmBGView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.setConfirmButtonBgColor()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func dismissVC(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    
    func setConfirmButtonBgColor() {
        //创建并实例化CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = confirmBGView.bounds
        //设置渐变的主颜色
        gradientLayer.colors = [UIColor(red:0.41, green:0.84, blue:0.98, alpha:1.00).cgColor, UIColor(red:0.26, green:0.55, blue:0.97, alpha:1.00).cgColor]
        
        //渲染的起始位置
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        //渲染的终止位置
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)

        //将gradientLayer作为子layer添加到主layer上
        confirmBGView.layer.addSublayer(gradientLayer)
        confirmBGView.clipsToBounds = true
    }
    
    //MARK: Action
    
    @IBAction func resignKeyboard(_ sender: Any) {
        if noteNameTextField.canResignFirstResponder {
            noteNameTextField.resignFirstResponder()
        }
        if userNameTextField.canResignFirstResponder {
            userNameTextField.resignFirstResponder()
        }
        if passwordTextField.canResignFirstResponder {
            passwordTextField.resignFirstResponder()
        }
        if passwordTwoTextField.canResignFirstResponder {
            passwordTwoTextField.resignFirstResponder()
        }
        if markTextField.canResignFirstResponder {
            markTextField.resignFirstResponder()
        }
    }
    
    @IBAction func confirmAll(_ sender: Any) {
        
        let model = NoteModel.init()
        model.noteName = noteNameTextField.text!
        model.userName = userNameTextField.text!
        model.mark = markTextField.text!
        let password1 = Password.init()
        password1.password = passwordTextField.text!
        let password2 = Password.init()
        password2.password = passwordTwoTextField.text!
        model.passwordList.append(password1)
        model.passwordList.append(password2)
        
        self.checkAllLegal(model: model)
    }
    
    func checkAllLegal(model: NoteModel) {
        if model.noteName == "" {
            noteNameTextField.shakeLeftRight()
            return
        }
        if model.userName == "" {
            userNameBGView.shakeLeftRight()
            return
        }
        if model.passwordList.first?.password == "" {
            passwordBGView.shakeLeftRight()
            return
        }
        
        NoteModel.createNewNoteModel(model: model)
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "kNotesHasChange"), object: nil, userInfo: nil)
        }
    }
    
    func popTheAlert() {
        let title = "帮你做了一个选择"
        let message = "message"
        let popup = PopupDialog.init(title: title, message: message)
        let cancelButton = CancelButton(title: "解决") {
        }
        
        let againButton = DefaultButton(title: "重试") {
            print("重试")
        }
        
        let saveButton = DefaultButton(title: "保存为自定") {
            print("保存为自定")
        }
        
        popup.addButtons([cancelButton, saveButton, againButton])
        self.present(popup, animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.placeholder {
        case "轻触编辑标题"?:
            userNameTextField.becomeFirstResponder()
        case "账号、用户名等"?:
            passwordTextField.becomeFirstResponder()
        case "登录、解锁、初始等密码"?:
            passwordTwoTextField.becomeFirstResponder()
        case "支付、二级等特殊密码"?:
            markTextField.becomeFirstResponder()
        default:
            if textField.canResignFirstResponder {
                textField.resignFirstResponder()
            }
        }
        return true
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
