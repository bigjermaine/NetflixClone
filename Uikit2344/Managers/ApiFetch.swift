//
//  ApiFetch.swift
//  Uikit2344
//
//  Created by Apple on 20/01/2023.
//

import Foundation
//https://api.themoviedb.org/3/trending/all/day?api_key=<<api_key>>
struct constants {
    static let Api_key = "30bbc9465ce5edc1448ae2367d7727b7"
    static let BaseURL = "https://api.themoviedb.org/3/movie/550?api_key="
    static let google = "AIzaSyD0nXdMQDmVE-Jl8_FSwbhlo8UGD7eUvHU"
}


class ApiCaller {
    
    
    static let shared = ApiCaller()
    ///Trending Movies fetch function
    func  gettrendingmovies(completion: @escaping (Result<[Results], Error>) ->  Void) {
        guard let  url = URL(string:"https://api.themoviedb.org/3/trending/movie/day?api_key=\(constants.Api_key)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode( TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    ///Trending Tv  fetch function
    func  gettrendingtv(completion: @escaping (Result<[tv], Error>) ->  Void) {
        guard let  url = URL(string:"https://api.themoviedb.org/3/trending/tv/day?api_key=\(constants.Api_key)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode( TrendinggtvResponses2.self,from: Data)
                completion(.success(results.Tv))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    ///Upcoming Movies fetch function
    func  getupcomingmovies(completion: @escaping (Result<[Results], Error>) ->  Void) {
        guard let  url = URL(string:"https://api.themoviedb.org/3/movie/upcoming?api_key=\(constants.Api_key)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    ///popular  Movies fetch function
    func  getpopularmovies(completion: @escaping (Result<[Results], Error>) ->  Void) {
     guard let  url = URL(string:"https://api.themoviedb.org/3/movie/popular?api_key=30bbc9465ce5edc1448ae2367d7727b7&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    ///toprated  Movies fetch function
    func  gettoprated(completion: @escaping (Result<[Results], Error>) ->  Void) {
        guard let  url = URL(string:"https://api.themoviedb.org/3/movie/    top_rated?api_key=30bbc9465ce5edc1448ae2367d7727b7&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    ///toprated  Movies fetch function
    func  getsearch( completion: @escaping (Result<[Results], Error>) ->  Void) {
        guard let  url = URL(string:"https://api.themoviedb.org/3/trending/movie/day?api_key=\(constants.Api_key)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    
    func  getsearch2( with query:String ,completion: @escaping (Result<[Results], Error>) ->  Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let  url = URL(string:"https://api.themoviedb.org/3/search/movie/day?api_key=\(constants.Api_key)&query=\(query)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendinggMoviesResponses.self,from: Data)
                completion(.success(results.results))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    
    func getyoutube(with query: String,completion: @escaping (Result<videoelement, Error>) ->  Void)  {
     guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        
        guard let  url =  URL(string:"https://youtube.googleapis.com/youtube/v3/search?q=\(query)&key=\(constants.google)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
           
            do {
                let results = try JSONDecoder().decode(youtubesearchresults.self,from: Data)
                completion(.success(results.items[0]))
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
