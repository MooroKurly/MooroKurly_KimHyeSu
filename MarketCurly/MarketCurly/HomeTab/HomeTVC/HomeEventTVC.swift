//
//  HomeEventTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/25.
//

import UIKit

class HomeEventTVC: UITableViewCell {
    
    public static let identifier = "HomeEventTVC"

    public static var imageList : [HomeEventDataModel] = []
    var i : Int = 0
    
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
    
    func getBannerData() {
        HomeEventService.shared.getHomeEventAds { (response) in
                    switch(response){
                    
                    case .success(let eventData):
                        if let data = eventData as? [HomeEventDataModel] {
                            for dataReal in data {
                                HomeEventTVC.imageList.append(contentsOf:
                                                                [HomeEventDataModel(id: dataReal.id, img: dataReal.img)])
                                print(self.i)
                                self.i = self.i+1
                            }
                            //HomeEventTVC.imageList = data
                            
                            self.homeEventCVC.reloadData()
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
    
    
    


extension HomeEventTVC : UICollectionViewDataSource {
    // Cell 몇 개 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeEventTVC.imageList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEventCVC.identifier, for: indexPath) as? HomeEventCVC else { return  UICollectionViewCell() }
        
        
        
        //cell.setData(image: imageList[indexPath.row].eventImageName)
        //cell.setData(imageURL: imageList[indexPath.row])
        cell.setData(imageURL: HomeEventTVC.imageList[indexPath.row].img)
        
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
    
//    func setData(homeEventModel: HomeEventDataModel) {
//
//        imageList = homeEventModel.eventImage
//
//    }

    func setData(imageURL : String){
        
//        let url = URL(string: imageURL)
//        eventImageView.kf.setImage(with: url)
    }
}
