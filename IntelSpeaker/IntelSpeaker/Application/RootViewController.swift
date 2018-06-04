//
//  RootViewController.swift
//  IntelSpeaker
//
//  Created by xiongzhengrui on 2018/6/2.
//  Copyright © 2018年 xiongzhengrui. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ACAccountManager.login(withAccount: "17316411674", password: "123456789") { (userID, error) in
            if error != nil {
                
                print("有错误")
            } else {
                print("失败")
            }
        }
        
        
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
