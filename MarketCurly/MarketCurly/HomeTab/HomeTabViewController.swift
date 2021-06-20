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
    
    var saleList : [HomeSaleDataModel] = []
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeTableFooterView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setData()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.allowsSelection = false
        //homeTableView.separatorStyle = .none
        
        homeTableView.tableFooterView = homeTableFooterView
        
        // Do any additional setup after loading the view.
    }
    
    
    func registerXib() {
        let eventNib = UINib(nibName: HomeEventTVC.identifier, bundle: nil)
        homeTableView.register(eventNib, forCellReuseIdentifier: HomeEventTVC.identifier)
        
        let productNib = UINib(nibName: HomeProductTVC.identifier, bundle: nil)
        homeTableView.register(productNib, forCellReuseIdentifier: HomeProductTVC.identifier)
        
        let saleNib = UINib(nibName: HomeSaleTVC.identifier, bundle: nil)
        homeTableView.register(saleNib, forCellReuseIdentifier: HomeSaleTVC.identifier)
        
    }
    

    
    func setData(){
        
        eventList = HomeEventTVC.imageList
        
        
        
        productList.append(contentsOf: [
            HomeProductDataModel(title: "이 상품 어때요?", product:
                                    [Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원"),
                                     Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원"),
                                     Product(productImage: UIImage(named: "imgProduct")!, productName: "[우리밀] 두부과자", productSale: "4%", productPrice: "2,200원")
                                    ])
            
        ])
        
        saleList.append(contentsOf: [
            HomeSaleDataModel(title: "일일특가", subtitle: "24시간 한정 특가", dailySale:
                                [DailySale(dailySaleImage: UIImage(named: "imgDailysale")!, dailySaleTitle: "[Kurly’s] 간편하게 바삭, 통등심 돈까스", dailySalePercent: "33%", dailySalePrice: "3,819원", dailyTime: "17:04:11"),
                                 DailySale(dailySaleImage: UIImage(named: "imgDailysale")!, dailySaleTitle: "[Kurly’s] 간편하게 바삭, 통등심 돈까스", dailySalePercent: "33%", dailySalePrice: "3,819원", dailyTime: "17:04:11")
                                 
                                ])
        ])
        
        
        
    }
    
    
    
    
}


extension HomeTabViewController : UITableViewDelegate {
    
}

extension HomeTabViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3  // 두개의 섹션을 사용할 것
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        
        case 0:
            return 1
            
        case 1:
            return productList.count
            
        case 2:
            return saleList.count
            
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier, for: indexPath) as? HomeEventTVC else { return UITableViewCell() }
            //cell.setData(homeEventModel: eventList[indexPath.row])
            //cell.setData(imageURL: HomeEventTVC.imageList[indexPath.row].img)
            cell.getBannerData()
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeProductTVC.identifier, for: indexPath) as? HomeProductTVC else { return UITableViewCell() }
            cell.setData(productList: productList[indexPath.row])
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeSaleTVC.identifier, for: indexPath) as? HomeSaleTVC else { return UITableViewCell() }
            cell.setData(saleModel: saleList[indexPath.row] )
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.width * (338/375)
        case 1:
            // 여기 크기 + 내부 컬렉션 뷰 cell 부분 높이 맞도록고치기
            return UIScreen.main.bounds.height * (419/812)
            
        case 2:
            
            return UIScreen.main.bounds.height * (343/812) * 2
            
        default:
            return 500
        }
        
        
        
        // 여기 분기처리..
        
    }
    
    
}



