//
//  HomeViewController.swift
//  Curly
//
//  Created by 김혜수 on 2021/05/11.
//  Copyright © 2021 kimhyesu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var topLabelCollectionView: UICollectionView!
    
    private var topLabelList : [TopLabelDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTopLabelList()
        topLabelCollectionView.delegate = self
        topLabelCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func setTopLabelList(){
        topLabelList.append(contentsOf: [TopLabelDataModel(topLabelName: "컬리추천"),
                                         TopLabelDataModel(topLabelName: "신상품"),
                                          TopLabelDataModel(topLabelName: "베스트"),
                                           TopLabelDataModel(topLabelName: "알뜰쇼핑"),
                                            TopLabelDataModel(topLabelName: "금주혜택")]
                                             )
    }

    

}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topLabelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: TopLabelCollectionViewCell.identifier, for: indexPath) as? TopLabelCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        topCell.setData(top: topLabelList[indexPath.row].topLabelName)
        
        return topCell
        
    }
    
    
}

extension HomeViewController : UICollectionViewDelegate {
    
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width)/6, height: collectionView.frame.height-10)
    }
    
}
