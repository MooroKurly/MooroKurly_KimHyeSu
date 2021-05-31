//
//  HomeSaleTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/31.
//

import UIKit

class HomeSaleTVC: UITableViewCell {
/* 일일특가 TVC */
    
    public static let identifier = "HomeSaleTVC"
    
    private var dailySale : [DailySale] = []
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerXib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeSaleTVC", bundle: nil)
    }
    
    func registerXib(){
        let nib = UINib(nibName: HomeSaleCVC.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: HomeSaleCVC.identifier)
    }
    
    func setData(saleModel : HomeSaleDataModel){
        titleLabel.text = saleModel.title
        subtitleLabel.text = saleModel.subtitle
        dailySale = saleModel.dailySale
    }
    
    
    
    
}

extension HomeSaleTVC : UICollectionViewDelegate {
    
}

extension HomeSaleTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailySale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSaleCVC.identifier, for: indexPath) as? HomeSaleCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(image: dailySale[indexPath.row].dailySaleImage, title: dailySale[indexPath.row].dailySaleTitle, salePercent: dailySale[indexPath.row].dailySalePercent, price: dailySale[indexPath.row].dailySalePrice, time: dailySale[indexPath.row].dailyTime)
        
        return cell
    }
    
    
}

extension HomeSaleTVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 250)
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
