//
//  HomeProductTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/27.
//

import UIKit

class HomeProductTVC: UITableViewCell {
    
    public static let identifier = "HomeProductTVC"
    
    private var product : [Product] = []
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
    
    func setData(productList: HomeProductDataModel){
        titleLabel.text = productList.title
        product = productList.product
        
    }
    
}

extension HomeProductTVC : UICollectionViewDelegate {
    
}

extension HomeProductTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCVC.identifier, for: indexPath) as? HomeProductCVC else {
            return UICollectionViewCell()
        }
        cell.setData(image: product[indexPath.row].productImage, productName: product[indexPath.row].productName, productSale: product[indexPath.row].productSale, productPrice: product[indexPath.row].productPrice)
        
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
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 6
        }
}
