//
//  CategoryTabViewController.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/20.
//

import UIKit
import ExpyTableView

class CategoryTabViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    // 이거.. 데이터 모델을 만들어 보자..!
    let arraySection0: Array<String> = ["채소","전체보기","친환경","고구마.감자.당근","시금치.쌈채소.나물","브로콜리.파프리카.양배추", "양파.대파.마늘.고추"
                                        ,"오이.호박.고추", "냉동.이색.간편채소", "콩나물.버섯"]
    let arraySection1: Array<String> = ["과일.견과.쌀","전체보기","친환경","제철과일","국산과일","수입과일","간편과일","냉동.건과일","견과류","쌀.잡곡"]
    let arraySection2: Array<String> = ["수산.해산.건어물","전체보기","제철수산","생선류","굴비.반건류","오징어.낙지.문어"
                                        ,"새우.게.랍스터","해산물.조개류","수산가공품","김.미역.해조류","건어물.다시팩"]
    let arraySection3: Array<String> = ["정육.계란","전체보기","국내산 소고기","수입산 소고기","돼지고기","계란류"
                                        ,"닭.오리고기","양념육.돈까스","양고기"]
    let arraySection4: Array<String> = ["국.반찬.메인요리","전체보기","국내산 소고기","수입산 소고기","돼지","계란류"
                                        ,"닭.오리고기","양념육.돈까스","양고기"]
    let arraySection5: Array<String> = ["샐러드.간편식","전체보기","국내산 소고기","수입산 소고기","돼지","계란류"
                                        ,"닭.오리고기","양념육.돈까스","양고기"]
    let arraySection6: Array<String> = ["면.양념.오일","전체보기","국내산 소고기","수입산 소고기","돼지","계란류"
                                        ,"닭.오리고기","양념육.돈까스","양고기"]
    let arraySection7: Array<String> = ["생수.음료.우유.커피","전체보기","국내산 소고기","수입산 소고기","돼지","계란류"
                                        ,"닭.오리고기","양념육.돈까스","양고기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    
    func registerXib() {
        let repeatNib = UINib(nibName: CategoryRepeatTVC.identifier, bundle: nil)
        categoryTableView.register(repeatNib, forCellReuseIdentifier: CategoryRepeatTVC.identifier)
        
        let expyNib = UINib(nibName: CategoryExpyTVC.identifier, bundle: nil)
        categoryTableView.register(expyNib, forCellReuseIdentifier: CategoryExpyTVC.identifier)
        
   
    }
    
    

}


extension CategoryTabViewController : UITableViewDelegate {
    
}

extension CategoryTabViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return arraySection0.count
        case 2:
            return arraySection1.count
        case 3:
            return arraySection2.count
        case 4:
            return arraySection3.count
        case 5:
            return arraySection4.count
        case 6:
            return arraySection5.count
        case 7:
            return arraySection6.count
        case 8:
            return arraySection7.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryRepeatTVC.identifier, for: indexPath) as? CategoryRepeatTVC else { return UITableViewCell() }
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection0[indexPath.row])
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection1[indexPath.row])
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection2[indexPath.row])
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection3[indexPath.row])
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection4[indexPath.row])
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection5[indexPath.row])
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection6[indexPath.row])
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryExpyTVC.identifier, for: indexPath) as? CategoryExpyTVC else { return UITableViewCell() }
            cell.setData(labelName: arraySection7[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}

extension CategoryTabViewController : ExpyTableViewDelegate {
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        if section == 1 {
            print("\(section)섹션")
            
            switch state {
            case .willExpand:
                print("WILL EXPAND")
                
            case .willCollapse:
                print("WILL COLLAPSE")
                
            case .didExpand:
                print("DID EXPAND")
                
            case .didCollapse:
                print("DID COLLAPSE")
            }
        }
       
    
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        }
    

    
    
}

extension CategoryTabViewController : ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        switch section {
        case 1 ... 8:
            return true
        
        default:
            return false
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        
        let cell = UITableViewCell()
        //let cell = CategoryExpyTVC()
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        
        
        switch section {
        case 1:
            cell.textLabel?.text = arraySection0[0]
            //cell.textLabel?.topAnchor.constraint(equalTo: view.topAnchor, constant: 54).isActive = true
            //cell.expyLabel?.text = arraySection0[0]
            return cell
        case 2:
            cell.textLabel?.text = arraySection1[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        case 3:
            cell.textLabel?.text = arraySection2[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        case 4:
            cell.textLabel?.text = arraySection3[0]
            return cell
        case 5:
            cell.textLabel?.text = arraySection4[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        case 6:
            cell.textLabel?.text = arraySection5[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        case 7:
            cell.textLabel?.text = arraySection6[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        case 8:
            cell.textLabel?.text = arraySection7[0]
            //cell.expyLabel?.text = arraySection1[0]
            return cell
        default:
            return cell
        }
        
    }
    
   
    
    
}
