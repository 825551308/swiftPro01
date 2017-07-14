//
//  RegistVC.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/14.
//  Copyright © 2017年 ccs. All rights reserved.
//

import UIKit

class RegistVC: BaseViewController {
    
    
    @IBOutlet weak var registerName:UITextField!
    @IBOutlet weak var registerPwd:UITextField!
    @IBOutlet weak var registerPwdAgain:UITextField!
    
    
    typealias RegisterBlock = (NSString) -> Void
    var registerBlock:RegisterBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /** 开始注册 */
    @IBAction func registerButtonClick(_ sender:Any){
        let uNameString = registerName.text! as NSString
        let pwdString = registerPwd.text! as NSString
        let pwdAgainString = registerPwdAgain.text! as NSString
        if self.validateRegister(userName: uNameString, pwd: pwdString,pwdAgain: pwdAgainString ) {
            if PlistManager().insertToUserInfoPlist(userName: uNameString, pwd: pwdString) {
                let uName:NSString = self.registerName.text! as NSString
                UIAlertView(title: nil, message: "\(uName) 注册成功！", delegate: nil, cancelButtonTitle: "知道啦").show()
                if self.responds(to: #selector(getter: registerBlock)) {
                    registerBlock!(uNameString)
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    /** 注册验证 */
    func validateRegister(userName:NSString,pwd:NSString,pwdAgain:NSString) ->Bool{
        if userName.length == 0 {
            UIAlertView(title: "提示", message: "请输入用户名！", delegate: self, cancelButtonTitle: "知道啦！").show()
            return false
        }
        
        if pwd.length < 6 {
            UIAlertView(title: "提示", message: "请输入6位数以上的密码！", delegate: self, cancelButtonTitle: "知道啦！").show()
            return false
        }
        if pwd != pwdAgain {
            UIAlertView(title: "提示", message: "两次输入的密码不一致！", delegate: self, cancelButtonTitle: "知道啦！").show()
            return false
        }
        return true
    }
}
