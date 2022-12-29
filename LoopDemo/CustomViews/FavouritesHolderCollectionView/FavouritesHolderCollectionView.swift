//
//  FavouritesHolderCollectionView.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit
import Reusable


final class FavouritesHolderCollectionView: UIView,NibOwnerLoadable,UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var favouritesCollectionView: UICollectionView!
     var favouritesList:Array<Movie> = Array<Movie>()
    var parentViewController:UIViewController?
          
          required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.loadNibContent()
          }
    
    func initializeSetupFavouritessHolderView(parentController:UIViewController?){
        parentViewController = parentController
        self.favouritesCollectionView.register(cellType: FavouritesMovieCollectionViewCell.self)
        
        favouritesCollectionView.delegate = self
        favouritesCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize(width: 20, height: 0)
        layout.itemSize = CGSize(width: 182,height: 270)
        layout.sectionHeadersPinToVisibleBounds = true

        //layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        favouritesCollectionView.setCollectionViewLayout(layout, animated: true)
        
        loadDatas()
    }
    
    func loadDatas(){
        favouritesList.removeAll()
        favouritesList.append(contentsOf: FavouriteDataSourceManager().getFavouriteMovies())
        favouritesCollectionView.reloadData()
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 1
        return 1
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2
//        let keyString = decorationsSymbolsList[section]
//        let arrayVal = KeyboardCommonSymobols.shared.getAllSymbolsValues()[keyString]
//        return arrayVal!.count
        return favouritesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as FavouritesMovieCollectionViewCell
        cell.loadCellData(from: favouritesList[indexPath.row])
              
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecorationsCollectionViewCellID", for: indexPath) as! DecorationsCollectionViewCell
//        let keyString = decorationsSymbolsList[indexPath.section]
//        let arrayVal = KeyboardCommonSymobols.shared.getAllSymbolsValues()[keyString]!
//        cell.lblDecorationText.text = arrayVal[indexPath.row]
//        // Configure the cell
//        // 3
        
        return cell
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item + 1)
//
//        let keyString = decorationsSymbolsList[indexPath.section]
//        let arrayVal = KeyboardCommonSymobols.shared.getAllSymbolsValues()[keyString]
//        let texttoEnter = arrayVal![indexPath.row]
//    KeyboardControllerInputHandlerSharedInstance.sharedInstance.textDocumentHandlerProxy.insertText(texttoEnter)
//    }
   
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        if (kind == UICollectionView.elementKindSectionFooter) {
////            return UIView() as! UICollectionReusableView
////        } else if (kind == UICollectionView.elementKindSectionHeader) {
////            let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DecorationsHeaderViewID", for: indexPath) as! DecorationsHeaderView
////            //headerView.backgroundColor = .red
////            headerView.labelTitle.text = decorationsSymbolsList[indexPath.section]
////            // Customize headerView here
////            return headerView
////        }
//        return UIView() as! UICollectionReusableView
//    }
    
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewControllerSBID") as! MovieDetailsViewController
        vc.selectedMovie = favouritesList[indexPath.row]
        parentViewController?.navigationController!.pushViewController(vc, animated: true)
 
    }
    

}
