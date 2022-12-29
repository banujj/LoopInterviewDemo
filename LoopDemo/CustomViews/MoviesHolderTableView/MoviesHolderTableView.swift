//
//  MoviesHolderTableView.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit
import Reusable

class MoviesHolderTableView: UIView,NibOwnerLoadable {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var parentViewController:UIViewController?
    var moviesList:Array<Movie> = Array<Movie>()
    var allMoviesList:Array<Movie> = Array<Movie>()
    @IBInspectable open var shouldShowFavouriteHeaders: Bool = true {
        didSet {
            
        }
    }
    
    @IBOutlet weak var moviesTableView: UITableView!
    // MARK: - Initializers
   
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.loadNibContent()
    }
    
    
    func setupAndInitializeMoviesData(for shouldShowFavouriteHeader:Bool){
        shouldShowFavouriteHeaders = shouldShowFavouriteHeader
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(cellType: MovieTableViewCell.self)

        moviesList.removeAll()
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let response:Array<Movie> = try decoder.decode(Array<Movie>.self, from: data)
                print(response)
                moviesList.append(contentsOf: response)
                allMoviesList.append(contentsOf: response)
            }
            catch {
                print(error)
            }
            
        }
        
        moviesTableView.reloadData()
    }
    
    func filterMovies(for nameSearch:String){
        moviesList.removeAll()
        let filtered = allMoviesList.filter { $0.title.contains(nameSearch) }
        if (nameSearch == ""){
            moviesList.append(contentsOf: allMoviesList)
        }else{
            moviesList.append(contentsOf: filtered)
        }
        moviesTableView.reloadData()
    }

}

extension MoviesHolderTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if shouldShowFavouriteHeaders == false{
            return 1
        }
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowFavouriteHeaders == false{
            return moviesList.count
        }else if section == 0{
            return 0
        }else{
            return moviesList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieTableViewCell
        cell.loadMovieCellData(with: moviesList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MoviesFavouriteHeaderCollectionView") as! MoviesFavouriteHeaderCollectionView
////        headerView.sectionTitleLabel.text = "TableView Heder \(section)"
//        return headerView
        
        if shouldShowFavouriteHeaders == false{
            return nil
        }
        
        let header = MoviesFavouriteHeaderCollectionView.loadFromNib() // Create one instance
        if section == 0{
            let attributedHeaderTitle = "YOUR FAVORITES".getThinAndBoldMixedString(boldableString: "FAVORITES", thinFont: UIFont.systemFont(ofSize: 12), boldFont:  UIFont.boldSystemFont(ofSize: 12.0))
            header.loadHeaderData(with: attributedHeaderTitle, shouldNeedFavouriteCollection: true)
        }else{
            let attributedHeaderTitle = "OUR STAFF PICKS".getThinAndBoldMixedString(boldableString: "STAFF PICKS", thinFont: UIFont.systemFont(ofSize: 12), boldFont:  UIFont.boldSystemFont(ofSize: 12.0))
            header.loadHeaderData(with: attributedHeaderTitle, shouldNeedFavouriteCollection: false)
        }
       
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if shouldShowFavouriteHeaders == false{
            return 0
        }
        if section == 0{
            return 330
        }else{
            return 44
        }
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomFooterView") as! CustomFooterView
//        footerView.footerLabel.text = "TableView Footer \(section)"
//        return footerView
        
//        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieTableViewCell
//        let header = tableView.dequeueReusableHeaderFooterView(MoviesFavouriteHeaderCollectionView.self) as! MoviesFavouriteHeaderCollectionView
//
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewControllerSBID") as! MovieDetailsViewController
        vc.selectedMovie = moviesList[indexPath.row]
        parentViewController?.navigationController!.pushViewController(vc, animated: true)
 
    }
}


