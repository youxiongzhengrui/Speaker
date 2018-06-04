//
//  RegisterViewController.swift
//  IntelSpeaker
//
//  Created by xiongzhengrui on 2018/6/2.
//  Copyright © 2018年 xiongzhengrui. All rights reserved.
//

import UIKit
import MBProgressHUD
import RxCocoa
import RxSwift


class RegisterViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var timerDisposeBag = DisposeBag()
    
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var codeTF: UITextField!
//    @IBOutlet weak var nickTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var codeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func getCode(_ sender: UIButton) {
        guard  (phoneTF.text?.trim().count)! >= 11 else {
            MBProgressHUD.showMessage("请输入正确手机号码", toview: view, afterDelay: 1)
            return
        }
        ACAccountManager.checkExist(phoneTF.text?.trim()) { [weak self] (isExist, error) in
            if error != nil {
                MBProgressHUD.showError((error?.localizedDescription)!)
            } else {
                if isExist {
                    MBProgressHUD.showError("该账户已注册，返回登录")
                } else {
                    ACAccountManager.sendVerifyCode(withAccount: self?.phoneTF.text?.trim(), template: 1, callback: { (error) in
                        if error == nil {
                            MBProgressHUD.showMessage("验证码已发送", toview: self?.view, afterDelay: 1)
                            self?.startCountDown()
                        }
                    })
                }
            }
        }
    }
    
    //获取验证码倒计时
    func startCountDown() {
        let timeout = 60
        codeButton.isEnabled = false
        Observable<Int>
            .timer(0, period: 1, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (timeElapse) in
                let time = timeout - timeElapse
                if time < 1 {
                    self?.timerDisposeBag = DisposeBag()
                    self?.codeButton.setTitle("获取验证码", for: .normal)
                    self?.codeButton.setTitleColor(.blue, for: .normal)
                    self?.codeButton.isEnabled = true
                } else {
                    self?.codeButton.setTitle("\(time)s", for: .normal)
                    self?.codeButton.setTitleColor(.gray, for: .normal)
                }
            }) {
                print("timer disposed")
            }.disposed(by: timerDisposeBag)
    }
    
    @IBAction func register(_ sender: Any) {
        guard  (phoneTF.text?.trim().count)! >= 11 else {
            MBProgressHUD.showMessage("请输入正确手机号码", toview: view, afterDelay: 1)
            return
        }
        
        guard !(codeTF.text?.trim().isEmpty)!  else {
            MBProgressHUD.showMessage("请输入验证码", toview: view, afterDelay: 1)
            return
        }
        
//        guard !(nickTF.text?.trim().isEmpty)! else {
//            MBProgressHUD.showMessage("请输入昵称", toview: view, afterDelay: 1)
//            return
//        }
        
        guard !(passwordTF.text?.trim().isEmpty)! else {
            MBProgressHUD.showMessage("请输入密码", toview: view, afterDelay: 1)
            return
        }
        
        ACAccountManager.register(withPhone: phoneTF.text?.trim(), email: "", password: passwordTF.text?.trim(), verifyCode: codeTF.text?.trim()) { [weak self] (userID, error) in
            if error != nil {
                MBProgressHUD.showError((error?.localizedDescription)!)
            } else {
                UserDefaults.standard.setValue(userID, forKey: "kUserID")
                UserDefaults.standard.synchronize()
                
                self?.dismiss(animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == codeTF {
            
        }
    }
}
