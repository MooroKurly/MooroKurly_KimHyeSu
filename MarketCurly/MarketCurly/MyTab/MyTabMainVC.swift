//
//  MyTabMainVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/27.
//

import UIKit

class MyTabMainVC: UIViewController {

    public static let identifier = "MyTabMainVC"
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        containerView.reloadInputViews()
        
        if (UserDefaults.standard.string(forKey: "token") == nil) {
            let storyboardMy = UIStoryboard(name: "MyTab", bundle: nil)
            let VC = storyboardMy.instantiateViewController(withIdentifier: MyTabViewController.identifier)
            self.addChild(VC)
            containerView.addSubview(VC.view)
            
        }
        else {
            print(UserDefaults.standard.string(forKey: "token")!, "이게 있어서..!")
            let storyboardMy = UIStoryboard(name: "LoginOKMyTab", bundle: nil)
            let VC = storyboardMy.instantiateViewController(withIdentifier: LoginOKMyTabVC.identifier)
            self.addChild(VC)
            containerView.addSubview(VC.view)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    

}
