//
//  LoginViewController.swift
//  IntelSpeaker
//
//  Created by xiongzhengrui on 2018/6/2.
//  Copyright © 2018年 xiongzhengrui. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {
   
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func register(_ sender: UIButton) {
        let vc = RegisterViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard  (phoneTF.text?.trim().count)! >= 11 else {
            MBProgressHUD.showMessage("请输入正确手机号码", toview: view, afterDelay: 1)
            return
        }
        
        guard !(passwordTF.text?.trim().isEmpty)! else {
            MBProgressHUD.showMessage("请输入密码", toview: view, afterDelay: 1)
            return
        }
        
        ACAccountManager.login(withAccount: phoneTF.text?.trim(), password: passwordTF.text?.trim()) { (userID, error) in
            if error != nil {
                MBProgressHUD.showError((error?.localizedDescription)!)
            } else {

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
