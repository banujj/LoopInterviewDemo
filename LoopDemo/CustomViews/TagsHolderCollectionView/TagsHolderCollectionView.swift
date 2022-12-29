//
//  TagsHolderCollectionView.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit
import Reusable


final class TagsHolderCollectionView: UIView,NibOwnerLoadable,UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var tagsCollectionView: UICollectionView!
     var tagsList:Array<String> = Array<String>()
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.loadNibContent()
          }
    
    func initializeTagsHolderView(with tags:[String]){
        
        self.tagsCollectionView.register(cellType: TagsHolderCollectionViewCell.self)
        
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        layout.itemSize = CGSize(width: 182,height: 44)
        layout.sectionHeadersPinToVisibleBounds = true
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        //layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        tagsCollectionView.setCollectionViewLayout(layout, animated: true)
        
        tagsList.append(contentsOf: tags)
        tagsCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as TagsHolderCollectionViewCell
        cell.loadCellData(from:tagsList[indexPath.row])
        //cell.applyKeyFactsViewHolderDesign(with: 22)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
   
    

}
