//
//  HomeTabViewController.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/20.
//

import UIKit

class HomeTabViewController: UIViewController {

    var eventList : [HomeEventDataModel] = []
    
    var productList : [HomeProductDataModel] = []
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setData()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.allowsSelection = false
        //homeTableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    
    func registerXib() {
        let eventNib = UINib(nibName: HomeEventTVC.identifier, bundle: nil)
        homeTableView.register(eventNib, forCellReuseIdentifier: HomeEventTVC.identifier)
        
        let productNib = UINib(nibName: HomeProductTVC.identifier, bundle: nil)
        homeTableView.register(productNib, forCellReuseIdentifier: HomeProductTVC.identifier)
    }
    
    func setData(){
        
        eventList.append(contentsOf: [
            HomeEventDataModel(eventImage: [EventImage(eventImageName: UIImage(named: "card_main")!),
                                            EventImage(eventImageName: UIImage(named: "card_main")!)
            ])
            
        ])
        productList.append(contentsOf: [
            HomeProductDataModel(title: "이 상품 어때요?", product:
                                    [Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원"),
                                     Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원"),
                                     Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원")
                                    ])
        
        ])
        

        
    }

  


}

extension HomeTabViewController : UITableViewDelegate {
    
}

extension HomeTabViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2  // 두개의 섹션을 사용할 것
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        
        case 0:
            return eventList.count
        
        case 1:
            return productList.count
        
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier, for: indexPath) as? HomeEventTVC else { return UITableViewCell() }
            cell.setData(homeEventModel: eventList[indexPath.row])
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeProductTVC.identifier, for: indexPath) as? HomeProductTVC else { return UITableViewCell() }
            cell.setData(productList: productList[indexPath.row])
            return cell
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UIScreen.main.bounds.width * (338/375)
        
    }
    
    
}



