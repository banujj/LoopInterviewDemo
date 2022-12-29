//
//  MovieDetailsViewController.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import UIKit
import FloatRatingView
import SDWebImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var lblDateAndTime: UILabel!
    @IBOutlet var lblMovieNameAndYear: UILabel!
    @IBOutlet var tagsCollectionView: UIView!
    @IBOutlet var lblOverviewDescription: UILabel!
    @IBOutlet var budgetKeyFactsView: KeyFactsView!
    @IBOutlet var revenueKeyFactsView: KeyFactsView!
    @IBOutlet var langaugeKeyFactsView: KeyFactsView!
    @IBOutlet var ratingKeyFactsView: KeyFactsView!
    
    @IBOutlet var tagsCollectionHolderView: TagsHolderCollectionView!
    
    var selectedMovie:Movie!
    var favBarButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        posterImageView.sd_setImage(with: URL(string: selectedMovie.posterURL), placeholderImage: UIImage(named: "placeholder.png"))
        posterImageView.applyPosterDesign(with: 14)
        
        ratingView.rating = selectedMovie.rating
        
        lblDateAndTime.text = selectedMovie.releaseDate.getMovieDetailsDateFromDateString() + " " + selectedMovie.runtime.getMovieDetailsMovieRunTimeString()
       
        let lblMovieYear:String = selectedMovie.releaseDate.getYearFromDateString()
        let lblMovieYearWithBrackets = "(" + lblMovieYear + ")"
        let lblMovieName:String = selectedMovie.title + "" + lblMovieYearWithBrackets
        lblMovieNameAndYear.attributedText = lblMovieName.getThinAndBoldMixedString(boldableString: selectedMovie.title, thinFont: UIFont.systemFont(ofSize: 24), boldFont: UIFont.boldSystemFont(ofSize: 24))
        
        lblOverviewDescription.text = selectedMovie.overview
        
        budgetKeyFactsView.loadKeyFacts(with: "Budget", value: String(selectedMovie.budget.currencyFormatting()))
        revenueKeyFactsView.loadKeyFacts(with: "Revenue", value: String((selectedMovie.revenue ?? 0).currencyFormatting()))
        
        let locale: Locale = .current
        langaugeKeyFactsView.loadKeyFacts(with: "Original Language", value:  locale.localizedString(forLanguageCode: selectedMovie.language.rawValue) ?? "")
        
        
        ratingKeyFactsView.loadKeyFacts(with: "Ratings", value: selectedMovie.rating.roundedDecimal(to: 2) + " (" + String(selectedMovie.reviews) + ")")
        
        
        tagsCollectionHolderView.initializeTagsHolderView(with: selectedMovie.genres)
        
        var favouriteImage = getFavImageForCurrentMovie()
        
        var closeImage = UIImage(named: "btn_close")
        closeImage = closeImage?.withRenderingMode(.alwaysOriginal)
        
        favBarButton = UIBarButtonItem(image: favouriteImage, style:.plain, target: self, action: #selector(favouriteButtonClicked))
        
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image:closeImage, style:.plain, target: self, action: #selector(closeButtonClicked)),favBarButton]
        
        // remove left buttons (in case you added some)
         self.navigationItem.leftBarButtonItems = []
        // hide the default back buttons
         self.navigationItem.hidesBackButton = true
    }
    
    @objc func favouriteButtonClicked(){
        FavouriteDataSourceManager().synchronizeFavouriteId(movieId: String(selectedMovie.id))
        favBarButton.image = getFavImageForCurrentMovie()
    }
    
    func getFavImageForCurrentMovie() -> UIImage{
        
        var favouriteImage = UIImage(named: "favorite_off")
        if FavouriteDataSourceManager().isMovieIDFavourited(movieId: String(selectedMovie.id)) {
            //Favourite
            favouriteImage = UIImage(named: "favorite_on")
        }
        favouriteImage = favouriteImage?.withRenderingMode(.alwaysOriginal)
        return favouriteImage!
    }
    
    @objc func closeButtonClicked(){
        
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
