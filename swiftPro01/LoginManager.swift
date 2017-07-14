//
//  LoginManager.swift
//  swiftPro01
//
//  Created by 金汕汕 on 2017/7/13.
//  Copyright © 2017年 ccs. All rights reserved.
//
import UIKit
import Foundation

/** final关键字的作用是这个类或方法不希望被继承和重写 */
class PlistManager:NSObject{
    class PlistManager{
        /** 单例 */
        static let shard = PlistManager.init()
        private  init(){}
    }
    
    //MARK: 创建userInfo.plist
    /** （如果已经存在，就不需要再创建了）*/
    func createPlist(){
        
        let fileManager = FileManager.default
        let documenDir:NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let writableDBPath = (documenDir[0] as AnyObject).appendingPathComponent("userInfo.plist") as String
        //判断沙盒的appData.plist文件是否存在,不存在则从资源目录复制一份
        let dbexits = fileManager.fileExists(atPath: writableDBPath)
        
        if (dbexits != true) {
            
            //资源里的appData.plist文件
            //        let dbFile = Bundle.main.path(forResource: "userInfo", ofType: "plist")!
            
            do {
                let data = Data(base64Encoded:"aGVsbG8gd29ybGQ=" ,options:.ignoreUnknownCharacters)
                let createRes:Bool? = fileManager.createFile(atPath: writableDBPath, contents: data, attributes: nil)
                if createRes == true{
                    print("创建userInfo.plist成功")
                }else{
                    print("创建userInfo.plist失败")
                }
                
            }
            //        catch{
            //            print("异常")
            //        }
            
        }else{
            print("userInfo.plist已经存在")
            
        }
    }
    
    //MARK: 写入userInfo.plist
    /**
     *  userName：用户名
     *  pwd：密码
     */
    public func insertToUserInfoPlist(userName:NSString,pwd:NSString) ->Bool{
        createPlist()
        if userName.length == 0 {
            UIAlertView(title: nil, message: "用户名不能为空!", delegate: nil, cancelButtonTitle: "知道啦").show()
            return false
        }
        if pwd.length == 0 {
            UIAlertView(title: nil, message: "密码不能为空!", delegate: nil, cancelButtonTitle: "知道啦").show()
            return false
        }
        
        let documenDir:NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let writableDBPath = (documenDir[0] as AnyObject).appendingPathComponent("userInfo.plist") as String
        var users:NSMutableArray? = NSMutableArray(contentsOfFile: writableDBPath)
        let dic:NSMutableDictionary = NSMutableDictionary()
        dic.setValue(userName, forKey: "userName")
        dic.setValue(pwd, forKey: "pwd")
        if users == nil {
            users = NSMutableArray()
        }
        users?.add(dic)
        let writeRes:Bool = users!.write(toFile: writableDBPath, atomically: true)
        if writeRes {
            print("成功写入userInfo.plist")
            return true
        }
        return false
    }
    
    //MARK: 检查登录
    /**
     *
     *  userName：用户名
     *  pwd：密码
     */
    func checkLogin(userName:NSString,pwd:NSString) ->Bool{
        createPlist()
        let documenDir:NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let writableDBPath = (documenDir[0] as AnyObject).appendingPathComponent("userInfo.plist") as String
        
        let localUsers:NSArray? = NSArray(contentsOfFile: writableDBPath)
        for num in (localUsers?.enumerated())!{
            let dic:NSDictionary? = num.element as? NSDictionary
            let uName:NSString = dic?.object(forKey: "userName") as! NSString
            let uPwd:NSString = dic?.object(forKey: "pwd") as! NSString
            if uName == userName  && uPwd == pwd{
                return true
            }
            continue
        }
        return false
        
    }
    
}



