//
//  MyTabViewController.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/20.
//

import UIKit

class MyTabViewController: UIViewController {
    
    public static let identifier = "MyTabViewController"

    @IBOutlet var allView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let labelList : [String] = ["비회원 주문 조회", "알림설정", "컬리소개", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        
        
    }
    
    func registerXib(){
        let topNib = UINib(nibName: MyTopTVC.identifier, bundle: nil)
        tableView.register(topNib, forCellReuseIdentifier: MyTopTVC.identifier)
        
        let backgroundNib = UINib(nibName: BackgroundXib.identifier, bundle: nil)
        tableView.register(backgroundNib, forCellReuseIdentifier: BackgroundXib.identifier)
        
        let labelNib = UINib(nibName: LabelTVC.identifier, bundle: nil)
        tableView.register(labelNib, forCellReuseIdentifier: LabelTVC.identifier)
    }
    
    @objc
    func loginButtonClicked(_ sender : UIButton){
        // 화면전환
        let sb = UIStoryboard(name: "MyTabLogin", bundle: nil)
        guard let nextVC = sb.instantiateViewController(identifier: MyTabLoginVC.identifier) as? MyTabLoginVC else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    

}

extension MyTabViewController : UITableViewDelegate {
   
}

extension MyTabViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTopTVC.identifier, for: indexPath) as? MyTopTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.loginButton.addTarget(self, action: #selector(loginButtonClicked(_:)), for: .touchUpInside)
            
            return cell
        case 1, 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BackgroundXib.identifier, for:indexPath) as? BackgroundXib else {
                return UITableViewCell()
            }
            return cell
        case 2...3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else { return UITableViewCell()}
            cell.setData(labelName: labelList[indexPath.row-2])
            cell.selectionStyle = .none
            return cell
            
        case 5...10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else { return UITableViewCell()}
            cell.setData(labelName: labelList[indexPath.row-3])
            cell.selectionStyle = .none
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 200
        case 1, 4:
            return 10
        case 2...3, 5...10:
            return 50
        default:
            return 100
        }
        
        
        
    }
    
    
}
