//
//  EventImageTableViewCell.swift
//  Curly
//
//  Created by 김혜수 on 2021/05/14.
//  Copyright © 2021 kimhyesu. All rights reserved.
//

import UIKit

class EventImageTableViewCell: UITableViewCell {

    static let identifier : String = "EventImageTableViewCell"
    
    
    @IBOutlet weak var eventImageCollectionView: UICollectionView!
    
    var eventImageList : [FirstImageListDataModel] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setEventImageList()
        eventImageCollectionView.delegate = self
        eventImageCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setEventImageList(){
        eventImageList.append(contentsOf: [FirstImageListDataModel(eventImageName: "imgBanner"),
                                           FirstImageListDataModel(eventImageName: "imgBanner")
        ])
        
    }
    
    
    
    
    
}

extension EventImageTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eventImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstImageCollectionViewCell.identifier, for: indexPath) as? FirstImageCollectionViewCell else { return UICollectionViewCell() }
    
        eventCell.setImageData(imageName: eventImageList[indexPath.row].eventImageName)
        return eventCell
    }
    
    
    
}

extension EventImageTableViewCell : UICollectionViewDelegate
{
    
}

extension EventImageTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellHeight = width
        let cellWidth = cellHeight * (340/375)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

