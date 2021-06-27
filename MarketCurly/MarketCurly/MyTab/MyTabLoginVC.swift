//
//  MyTabLoginVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/18.
//

import UIKit

class MyTabLoginVC: UIViewController {
    
    public static let identifier = "MyTabLoginVC"

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
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loginAction(){
        LoginService.shared.login(id: self.idTextField.text!, pw: self.passwordTextField.text!){ result in
            switch result {
            case .success(let token) :
                //self.makeAlert(title: "알림", message: "로그인 성공")
                print("토큰출력",token)
                UserDefaults.standard.set(token, forKey: "token")
                print("저장된 UserDefaults 출력")
                print(UserDefaults.standard.string(forKey: "token")!)
                
                self.dismiss(animated: true, completion: nil)
                
               
                
            case .requestErr:
                self.makeAlert(title: "알림", message: "로그인 실패")
            default:
                print("오류")
            }
            
        }
    }
    

}
