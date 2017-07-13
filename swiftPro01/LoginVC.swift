//
//  LoginVC.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/13.
//  Copyright © 2017年 ccs. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pwdTextField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginVC")
        // Do any additional setup after loading the view.
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.registerButtonAction(_serder:)))
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

    @IBAction func LoginButtonAction(_ sender: Any) {
        if userNameTextField.text == "张三" && pwdTextField.text == "123" {
            /** 写法1 */
//            let me = userNameTextField.text!
//            let message = "恭喜您\(me),登录成功！"
            /** 写法2 */
            let message = "恭喜您\(userNameTextField.text ?? ""),登录成功！"
            
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
    
//    func registerButtonAction(_serder:Any){
//        print("跳转注册界面!")
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
