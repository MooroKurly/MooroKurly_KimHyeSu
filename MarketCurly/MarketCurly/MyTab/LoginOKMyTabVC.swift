//
//  LoginOKMyTabVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/24.
//

import UIKit

class LoginOKMyTabVC: UIViewController {
    
    public static let identifier = "LoginOKMyTabVC"

    @IBOutlet var allView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let labelList : [String] = ["적립금", "쿠폰", "친구초대",
                                "주문 내역", "상품 후기",
                                "배송지 관리", "컬리 퍼플 박스", "개인정보 수정", "알림설정",
                                "상품 문의", "1:1 문의", "대량주문 문의",
                                "컬리소개", "컬리패스", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내",
                                "로그아웃"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
        
    }
    
    func registerXib() {
        let topNib = UINib(nibName: LoginOKTopTVC.identifier, bundle: nil)
        tableView.register(topNib, forCellReuseIdentifier: LoginOKTopTVC.identifier)
        
        let backgroundNib = UINib(nibName: BackgroundXib.identifier, bundle: nil)
        tableView.register(backgroundNib, forCellReuseIdentifier: BackgroundXib.identifier)
        
        let labelNib = UINib(nibName: LabelTVC.identifier, bundle: nil)
        tableView.register(labelNib, forCellReuseIdentifier: LabelTVC.identifier)
        
        let bannerXib = UINib(nibName: MyBannerTVC.identifier, bundle: nil)
        tableView.register(bannerXib, forCellReuseIdentifier: MyBannerTVC.identifier)
        
    }
    

    

}

extension LoginOKMyTabVC : UITableViewDelegate {
    
}

extension LoginOKMyTabVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginOKTopTVC.identifier, for: indexPath) as? LoginOKTopTVC else {
                return UITableViewCell()
            }
            
            return cell
        case 1, 3, 7, 10, 15, 19, 27, 29:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BackgroundXib.identifier, for: indexPath) as? BackgroundXib else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyBannerTVC.identifier, for: indexPath) as? MyBannerTVC else {
                return UITableViewCell()
            }
            
            cell.setData(title: "컬리가 생각하는 Love Food, Love Life",
                         subtitle: "3천원 쿠폰에 적립금의 행운까지!", backgroundColor: UIColor(red: 0.94, green: 0.91, blue: 0.87, alpha: 1.0))
            
            return cell
        case 4 ... 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-4])
            return cell
            
        case 8 ... 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-5])
            return cell
            
        case 11 ... 14:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-6])
            return cell
        case 16 ... 18:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-7])
            return cell
        case 20 ... 26:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-8])
            return cell
        case 28:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else {
                return UITableViewCell()
            }
            cell.setData(labelName: labelList[indexPath.row-9])
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1, 3, 7, 10, 15, 19, 27, 29:
            return 10
        case 2:
            return 62
        case 4 ... 6, 8 ... 9, 11 ... 14, 16 ... 18, 20 ... 26, 28:
            return 50
        default:
            return 100
        }
    }
    
}
