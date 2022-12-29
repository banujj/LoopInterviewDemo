//
//  MoviesSearchViewController.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import UIKit

class MoviesSearchViewController: UIViewController,UISearchBarDelegate {
    @IBOutlet weak var moviesHolderView: MoviesHolderTableView!
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.text = "All Movies"
        titleLabel.backgroundColor = .clear
        self.navigationItem.titleView = titleLabel
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btn_back"), for: .normal)
        button.addTarget(self, action: #selector(btnBackClicked), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.sizeToFit()
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
        
        self.moviesSearchBar.backgroundColor = .white
        self.moviesSearchBar.searchBarStyle = .minimal
        moviesSearchBar.searchTextField.backgroundColor = .white
        moviesSearchBar.barTintColor = .white
        moviesSearchBar.delegate = self
        
        moviesHolderView.setupAndInitializeMoviesData(for: false)
        // Do any additional setup after loading the view.
    }
    
    @objc func btnBackClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        moviesHolderView.filterMovies(for: searchText)
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
