//
//  FavouriteDataSourceManager.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 29/12/22.
//

import Foundation

public class FavouriteDataSourceManager {
    
    func synchronizeFavouriteId(movieId:String){
        
        if let array = UserDefaults.standard.array(forKey: favIdKey){
            var finalArray = array  as! Array<String>
            if finalArray.contains(movieId) {
                if let index = finalArray.firstIndex(of:movieId) {
                    finalArray.remove(at: index)
                    UserDefaults.standard.set(finalArray, forKey: favIdKey)
                }
            }else{
                finalArray.append(String(movieId))
                UserDefaults.standard.set(finalArray, forKey: favIdKey)
            }
        }else{
            let firstTimeFavorite = [String(movieId)]
            UserDefaults.standard.set(firstTimeFavorite, forKey: favIdKey)
            
        }
        UserDefaults.standard.synchronize()
    }
    
    func isMovieIDFavourited(movieId:String) -> Bool{
        if let array = UserDefaults.standard.array(forKey: favIdKey) as? [String]{
           return array.contains(movieId) ? true : false
        }
        return false
    }
    
    
    
    func getFavouriteMovies()-> [Movie]{
        
        var favMoviesList:Array<Movie> = Array<Movie>()
       
        let allMovies = self.getAllMovies()
        
        if let array = UserDefaults.standard.array(forKey: favIdKey){
            for currentKey in (array as? [String])!{
                //let currentKeyString = String(currentKey)
                if let currentFavMovie = allMovies.filter({String($0.id) == currentKey}).first
               {
                    favMoviesList.append(currentFavMovie)
                }
                
                
            }
            
        }
        return favMoviesList
    }
    
    func getAllMovies() -> [Movie]{
        var moviesList:Array<Movie> = Array<Movie>()
        
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let response:Array<Movie> = try decoder.decode(Array<Movie>.self, from: data)
                moviesList.append(contentsOf: response)
            }
            catch {
                print(error)
            }
            
        }
        return moviesList
    }
    
}
