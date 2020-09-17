//
//  RESTAlamofire.swift
//  Carangas
//
//  Created by Douglas Frari on 9/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import Alamofire

class RESTAlamofire {
    
    class func loadCars(onComplete: @escaping ([Car]) -> Void, onError: @escaping (CarError) -> Void) {
        
        AF.request(REST.basePath).responseJSON { response in
            
            do {
                if response.data == nil {
                    onError(.noData)
                    return
                }
                
                if let error = response.error {
                    
                    if error.isSessionTaskError || error.isInvalidURLError {
                        onError(.url)
                        return
                    }
                    
                    if error._code == NSURLErrorTimedOut {
                        onError(.noResponse)
                    } else if error._code != 200 {
                        onError(.responseStatusCode(code: error._code))
                    }
                }
                
                let cars = try JSONDecoder().decode([Car].self, from: response.data!)
                onComplete(cars)
            } catch is DecodingError {
                onError(.invalidJSON)
            } catch {
                onError(.taskError(error: error))
            }
            
        }
        
        
    }
    
    class func save(car: Car, onComplete: @escaping (Bool) -> Void, onError: @escaping (CarError) -> Void ) {
        applyOperation(car: car, operation: .save, onComplete: onComplete, onError: onError)
    }
    
    class func update(car: Car, onComplete: @escaping (Bool) -> Void,onError: @escaping (CarError) -> Void ) {
        applyOperation(car: car, operation: .update, onComplete: onComplete, onError: onError)
    }
    
    class func delete(car: Car, onComplete: @escaping (Bool) -> Void, onError: @escaping (CarError) -> Void ) {
        applyOperation(car: car, operation: .delete, onComplete: onComplete, onError: onError)
    }
    
    
    private class func applyOperation(car: Car, operation: RESTOperation , onComplete: @escaping (Bool) -> Void, onError: @escaping (CarError) -> Void ) {
        
        // o endpoint do servidor para update é: URL/id
        let urlString = REST.basePath + "/" + (car._id ?? "")
        
        guard let url = URL(string: urlString) else {
            onError(.url)
            return
        }
        var request = URLRequest(url: url)
        var httpMethod: HTTPMethod = .get
        
        switch operation {
        case .delete:
            httpMethod = HTTPMethod.delete
        case .save:
            httpMethod = HTTPMethod.post
        case .update:
            httpMethod = HTTPMethod.put
        }
        
        
        // transformar objeto para um JSON, processo contrario do decoder -> Encoder
        guard let json = try? JSONEncoder().encode(car) else {
            onError(.invalidJSON)
            return
        }
        
        request.httpBody = json
        
        AF.request(url,
                   method: httpMethod,
                   parameters: car,
                   encoder: JSONParameterEncoder.default).response { response in
        
            if response.error == nil {
                
                guard let responseFinal = response.response else {
                    onError(.noResponse)
                    return
                }
                
                if responseFinal.statusCode == 200 {
                    
                    onComplete(true)
                    
                } else {
                    onError(.responseStatusCode(code: response.response!.statusCode))
                }
            } else {
                onError(.taskError(error: response.error!))
            }
        }
    }
    
    
} // fim da classe RESTAlamofire
