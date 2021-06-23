//
//  MyTabLoginVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/18.
//

import UIKit

class MyTabLoginVC: UIViewController {

    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinButton.layer.borderColor = UIColor.purple.cgColor
        joinButton.layer.borderWidth = 1
        
    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {
        loginAction()
    }
    
    func loginAction(){
        LoginService.shared.login(id: self.idTextField.text!, pw: self.passwordTextField.text!){ result in
            switch result {
            case .success:
                self.makeAlert(title: "알림", message: "로그인 성공")
            case .requestErr:
                self.makeAlert(title: "알림", message: "로그인 실패")
            default:
                print("오류")
            }
            
        }
    }
    

}
