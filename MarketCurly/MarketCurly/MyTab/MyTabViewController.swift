//
//  MyTabViewController.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/20.
//

import UIKit

class MyTabViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    func registerXib(){
        let topNib = UINib(nibName: MyTopTVC.identifier, bundle: nil)
        tableView.register(topNib, forCellReuseIdentifier: MyTopTVC.identifier)
    }
    
    @objc
    func loginButtonClicked(_ sender : UIButton){
        // 화면전환
        let sb = UIStoryboard(name: "MyTabLogin", bundle: nil)
        guard let nextVC = sb.instantiateViewController(identifier: MyTabLoginVC.identifier) as? MyTabLoginVC else { return }
        self.present(nextVC, animated: true, completion: nil)
    }
    

}

extension MyTabViewController : UITableViewDelegate {
   
}

extension MyTabViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTopTVC.identifier, for: indexPath) as? MyTopTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.loginButton.addTarget(self, action: #selector(loginButtonClicked(_:)), for: .touchUpInside)
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 200
        default:
            return 100
        }
        
        
        
    }
    
    
}
