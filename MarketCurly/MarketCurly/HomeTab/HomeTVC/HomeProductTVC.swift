//
//  HomeProductTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/27.
//

import UIKit

class HomeProductTVC: UITableViewCell {
    
    public static let identifier = "HomeProductTVC"
    public static var productList : [HomeProductDataModel] = []
    
    //private var product : [Product] = []
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeProductTVC", bundle: nil)
    }
    func registerXib(){
        let nib = UINib(nibName: HomeProductCVC.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: HomeProductCVC.identifier)
    }
    
    func setData(){
        titleLabel.text = "이 상품 어때요?"
        
    }
    
    func getProductThisData(){
        HomeThisService.shared.getHomeThis{ (response) in
            switch response {
            case .success(let thisData):
                if let data = thisData as? [HomeProductDataModel]{
                    for dataReal in data {
                        HomeProductTVC.productList.append(contentsOf: [HomeProductDataModel(id: dataReal.id, thumbnail: dataReal.thumbnail, store: dataReal.store, title: dataReal.title, subtitle: dataReal.subtitle, price: dataReal.price, discount: dataReal.discount, category: dataReal.category, v: dataReal.v, bargain: dataReal.bargain)])
                        
                    }
                    self.collectionView.reloadData()
                }
            case .requestErr(let message) :
                print("requestERR", message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}

extension HomeProductTVC : UICollectionViewDelegate {
    
}

extension HomeProductTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HomeProductTVC.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCVC.identifier, for: indexPath) as? HomeProductCVC else {
            return UICollectionViewCell()
        }
        cell.setData(image: HomeProductTVC.productList[indexPath.row].thumbnail,
                     productName: HomeProductTVC.productList[indexPath.row].title,
                     productSale: String(HomeProductTVC.productList[indexPath.row].discount) + "%",
                     productPrice: String(HomeProductTVC.productList[indexPath.row].price) + "원")

        
        return cell
    }
    
    
}

extension HomeProductTVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(UIScreen.main.bounds.width)
        
        let cellWidth = UIScreen.main.bounds.width * (150/375)
        let cellHeight = cellWidth * (338/150)
        
        return CGSize(width: cellWidth , height: cellHeight)
    
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 6
        }
}
