//
//  MainVC.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/13.
//  Copyright © 2017年 ccs. All rights reserved.
//

import UIKit

class MainVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainVC")
        // Do any additional setup after loading the view.
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

    @IBAction func layout(_ sender: Any) {
        UserDefaults.standard.set("0.0", forKey: "loginState")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "noneLoginSegue")
        self.present(vc, animated: true) { 
            print("退出登录成功！")
        }
    }
}
