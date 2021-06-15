//
//  HomeEventTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/25.
//

import UIKit

class HomeEventTVC: UITableViewCell {
    
    public static let identifier = "HomeEventTVC"

    private var imageList : [EventImage] = []
    
    @IBOutlet weak var homeEventCVC: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        
        homeEventCVC.delegate = self
        homeEventCVC.dataSource = self
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeEventTVC", bundle: nil)
    }
    
    
    
}

extension HomeEventTVC : UICollectionViewDataSource {
    // Cell 몇 개 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventCVC.identifier, for: indexPath) as? HomeEventCVC else { return  UICollectionViewCell() }
        
        
        cell.setData(image: imageList[indexPath.row].eventImageName)
        
        
        return cell
        
    }
    
    
}

extension HomeEventTVC : UICollectionViewDelegate {
    
}

extension HomeEventTVC : UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(UIScreen.main.bounds.width)
        
        let cellHeight = UIScreen.main.bounds.width * (338/375)
        
        return CGSize(width: UIScreen.main.bounds.width , height: cellHeight)
    
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}

extension HomeEventTVC {
    
    
     func registerXib() {

        let nib = UINib(nibName: HomeEventCVC.identifier, bundle: nil)
        homeEventCVC.register(nib, forCellWithReuseIdentifier: HomeEventCVC.identifier)

    }
    
    func setData(homeEventModel: HomeEventDataModel) {
        
        imageList = homeEventModel.eventImage
        
    }

}
