//
//  LoginVC.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/13.
//  Copyright © 2017年 ccs. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pwdTextField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.registerButtonAction(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginButtonAction(_ sender: Any) {
        let uNameString = userNameTextField.text! as NSString
        let pwdString = pwdTextField.text! as NSString
        /** 登录验证 */
        if !self.validateLogin(userName: uNameString, pwd: pwdString) {
            return
        }
        /** 从plist文件里检查登录 */
        let checkLogin:Bool = PlistManager().checkLogin(userName: uNameString, pwd: pwdString)
        if checkLogin {
            /** 写法1 */
//            let me = userNameTextField.text!
//            let message = "恭喜您\(me),登录成功！"
            /** 写法2 */
            let message = "恭喜您\(userNameTextField.text ?? ""),登录成功！"
            self.view.endEditing(true)
            print(message)
            let alert = UIAlertView(title: "提示", message: message, delegate: self, cancelButtonTitle: "知道啦！")
            alert.show()
            /**  */
            UserDefaults.standard.set("1.0", forKey: "loginState")
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginSegue")
            self.present(vc, animated: true, completion: nil)
        }else{
            print("登录失败")
            let alert = UIAlertView(title: "提示", message: "登录失败！", delegate: self, cancelButtonTitle: "知道啦！")
            alert.show()
        }
        
    }
    
    /** 登录验证 */
    func validateLogin(userName:NSString,pwd:NSString) ->Bool{
        if userName.length == 0 {
            UIAlertView(title: "提示", message: "请输入用户名！", delegate: self, cancelButtonTitle: "知道啦！").show()
            return false
        }
        if pwd.length == 0 {
            UIAlertView(title: "提示", message: "请输入密码！", delegate: self, cancelButtonTitle: "知道啦！").show()
            return false
        }
        return true
    }
    
    func registerButtonAction(_ sender:Any) -> Void {
        let vc:RegistVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registerVC") as! RegistVC
        weak var weakSelf = self
        vc.registerBlock = {(str) in
            if str.length > 0 {
                weakSelf?.userNameTextField.text = str as String
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
