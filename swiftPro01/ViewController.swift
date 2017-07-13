//
//  ViewController.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/13.
//  Copyright © 2017年 ccs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let localLoginState:String? = UserDefaults.standard.object(forKey: "loginState") as! String?
        if localLoginState != nil {
            print("取出来:"+localLoginState!)
        }
        if localLoginState == "1.0"{
            print("已经登录")
//            UserDefaults.standard.set("0.0", forKey: "loginState")
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "loginSegue")
            //            self.navigationController!.pushViewController(vc, animated: true)
            self.present(vc, animated: true, completion: {
                print("首页界面-跳转成功!")
            })
            
        }else{
            print("未登录")
//            UserDefaults.standard.set("1.0", forKey: "loginState")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "noneLoginSegue")
            //            self.navigationController!.pushViewController(vc, animated: true)
            self.present(vc, animated: true, completion: {
                print("未登录界面-跳转成功")
            })
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

