//
//  API.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 14/01/22.
//

import Foundation

private let baseURL = "https://api.themoviedb.org"
private let apiKey = "dab9b242bdeecdff3d4a8e222a77b4c7"

enum MovieError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJson }

class API {
    
    // MARK: - URLSession Configurate
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    //MARK: - Request Movies
    
    static func fetchMovie (idMovie: Int, completion: @escaping (MovieHomeModel) -> Void, onError: @escaping (MovieError) -> Void) {
        
        let urlString = "\(baseURL)/3/movie/\(idMovie)?api_key=\(apiKey)&language=pt-BR"
        guard let url = URL(string: urlString) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        return
                    }
                    do {
                        let resultsMovie = try JSONDecoder().decode(MovieHomeModel.self, from: data)
                        completion(resultsMovie)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJson)
                    }
                } else {
                    print("status code invalido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    
    static func fetchMoviesSimilar (idMovie: Int, completion: @escaping (ResultsMovies) -> Void, onError: @escaping (MovieError) -> Void) {
        let urlString = "\(baseURL)/3/movie/\(idMovie)/similar?api_key=\(apiKey)&language=pt-BR"
        guard let url = URL(string: urlString) else {
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        return
                    }
                    do {
                        let results = try JSONDecoder().decode(ResultsMovies.self, from: data)
                        completion(results)
                    } catch {
                        print("erro ao decodificar o json")
                        onError(.invalidJson)
                    }
                } else {
                    print("status code invalido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}

