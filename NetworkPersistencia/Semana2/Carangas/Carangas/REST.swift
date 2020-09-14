//
//  REST.swift
//  Carangas
//
//  Created by Douglas Frari on 8/27/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation


enum CarError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class REST {
    
    // URL principal do servidor que obtem os dados dos carros cadastrados la
    private static let basePath = "https://carangas.herokuapp.com/cars"
    
    
    // session criada automaticamente e disponivel para reusar
    private static let session = URLSession(configuration: configuration)
    
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 15.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    class func loadCars(onComplete: @escaping ([Car]) -> Void, onError: @escaping (CarError) -> Void) {
           
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
           
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            // usamos uma closure para receber as respostas, ou seja, estamos em um processo
            // em background que será assincrono
            
            // 1
            if error == nil {
                // 2
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    
                    // servidor respondeu com sucesso :)
                    // 3
                    // obter o valor de data
                    guard let data = data else {
                        onError(.noData)
                        return
                    }
                    
                    do {
                        
                        let cars = try JSONDecoder().decode([Car].self, from: data)
                        // pronto para reter dados
                        
                        onComplete(cars)
                        
                    } catch {
                        // algum erro ocorreu com os dados
                        onError(.invalidJSON)
                    }
                    
                    
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
            
        }
        
        // start request
        dataTask.resume()
    }
    
    
    
}
