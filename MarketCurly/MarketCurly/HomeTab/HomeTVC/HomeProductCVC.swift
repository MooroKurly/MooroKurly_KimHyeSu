//
//  HomeProductCVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/27.
//

import UIKit
import Kingfisher

class HomeProductCVC: UICollectionViewCell {

    public static let identifier = "HomeProductCVC"
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSaleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeProductCVC", bundle: nil)
   }
    
//    func setData(image: UIImage, productName: String, productSale: String, productPrice: String) {
//        productImageView.image = image
//        productNameLabel.text = productName
//        productSaleLabel.text = productSale
//        productPriceLabel.text = productPrice
//    }
    func setData(image: String, productName: String, productSale: String, productPrice: String) {
        let url = URL(string: image)
        productImageView.kf.setImage(with: url)
        productNameLabel.text = productName
        productSaleLabel.text = productSale
        productPriceLabel.text = productPrice
    }

}
