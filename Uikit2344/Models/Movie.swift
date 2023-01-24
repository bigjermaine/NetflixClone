//
//  Movie.swift
//  Uikit2344
//
//  Created by Apple on 20/01/2023.
//

import Foundation




struct TitlePreviewViewModel {
    let title:String
    let youtubeview:videoelement
    let titleoverview:String
    
    
}





///YoutubeApiFetch
struct youtubesearchresults: Codable {
    
    let items: [videoelement]
}


struct videoelement: Codable {
    let id:idvideoelement
}


struct idvideoelement:Codable {
    let kind:String
    let videoId: String
}






///MovieTmbdApiFetch
struct Results2: Codable {
    let name: String
    let poster: String
}


    // MARK: - TrendinggMoviesResponses(Movie)
    struct TrendinggMoviesResponses: Codable {
        let page: Int
        let results: [Results]
        let totalPages, totalResults: Int

        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }

    // MARK: - Result
    struct Results: Codable {
        let adult: Bool
        let backdropPath: String
        let id: Int
        let name: String?
        let originalLanguage: String
        let originalName: String?
        let overview, posterPath: String
        let mediaType: MediaType
        let genreIDS: [Int]
        let popularity: Double
        let firstAirDate: String?
        let voteAverage: Double
        let voteCount: Int
        let originCountry: [String]?
        let title, originalTitle, releaseDate: String?
        let video: Bool?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case id, name
            case originalLanguage = "original_language"
            case originalName = "original_name"
            case overview
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case genreIDS = "genre_ids"
            case popularity
            case firstAirDate = "first_air_date"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case originCountry = "origin_country"
            case title
            case originalTitle = "original_title"
            case releaseDate = "release_date"
            case video
        }
    }

    enum MediaType: String, Codable {
        case movie = "movie"
        case tv = "tv"
    }

    
    
    



// MARK: - TrendinggMoviesResponses(Tv)
struct TrendinggtvResponses2: Codable {
    let page: Int
    let Tv: [tv]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case Tv = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct  tv: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String?
    let originalLanguage: String
    let originalName: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
    }
}





