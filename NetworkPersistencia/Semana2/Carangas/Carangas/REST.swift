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
    
    
    class func save(car: Car, onComplete: @escaping (Bool) -> Void ) {
        // 1 - URL BASE https://carangas.herokuapp.com/cars
        guard let url = URL(string: basePath) else {
            onComplete(false)
            return
        }
        
        // 2 - metodo POST precisa ser setado na URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

       
        // 3 - transformar Objeto para JSON para enviar na requisito
        // transformar objeto para um JSON, processo contrario do decoder -> Encoder
        guard let json = try? JSONEncoder().encode(car) else {
            onComplete(false)
            return
        }
        request.httpBody = json

        // 4 - requisição propriamente dita como uma CLOSURE
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            
            // 5 verifica resposta do servidor e retorna SUCESSO
            if error == nil {
                           
                // verificar e desembrulhar em uma unica vez
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let _ = data else {
                  onComplete(false)
                  return
                }
                           
                // sucesso
                onComplete(true)
                           
            } else {
                onComplete(false)
            }
            
            
        }
        
        dataTask.resume()

        
    }
    
    
    
    class func update(car: Car, onComplete: @escaping (Bool) -> Void ) {
        
        
        
        
        // 1 -- bloco novo: o endpoint do servidor para UPDATE é: URL/id
        let urlString = basePath + "/" + car._id!
        
        // 2 -- usar a urlString ao invés da basePath
        guard let url = URL(string: urlString) else {
            onComplete(false)
            return
        }
       
        // 3 -- o verbo do httpMethod deve ser alterado para PUT ao invés de POST
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        
        // 4 - transformar Objeto para JSON para enviar na requisito
        // transformar objeto para um JSON, processo contrario do decoder -> Encoder
        guard let json = try? JSONEncoder().encode(car) else {
            onComplete(false)
            return
        }
        request.httpBody = json

        // 5 - requisição propriamente dita como uma CLOSURE
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            
            // 6 verifica resposta do servidor e retorna SUCESSO
            if error == nil {
                           
                // verificar e desembrulhar em uma unica vez
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let _ = data else {
                  onComplete(false)
                  return
                }
                           
                // sucesso
                onComplete(true)
                           
            } else {
                onComplete(false)
            }
            
            
        }
        
        dataTask.resume()

        
    }
    
} // fim da classe REST
