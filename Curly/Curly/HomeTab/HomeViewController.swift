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
    //@IBOutlet weak var firstImageCollectionView: UICollectionView!
    @IBOutlet weak var contentTableView: UITableView!
    
    private var topLabelList : [TopLabelDataModel] = []
    private var topImageList : [ImageTableCellDataModel] = []
    
    
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
    
    func setEventImageList(){
        topImageList.append(contentsOf: [ImageTableCellDataModel(imageCollection: "EventImageCollectionView")])
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

/// 테이블 뷰 익스텐션
// 테이블 뷰 모양, 동작
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
}

// 데이터 받아서 뷰 그려줌
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: EventImageTableViewCell.identifier, for: indexPath) as? EventImageTableViewCell else { return UITableViewCell()}
        
        imageCell.setEventImageList()
        
        
        return imageCell
    }
    
    
}
