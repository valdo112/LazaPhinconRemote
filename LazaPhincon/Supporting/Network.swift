//
//  Network.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 27/07/23.
//

import Foundation
import Alamofire

class Network{
    static let sharedInstance = Network()
    
    
    func fetchAPICategory(completion: @escaping (Categories) -> Void){
        let url = "https://fakestoreapi.com/products/categories"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        guard let data = data else {
                            print("Data is nil")
                            return
                        }
                        let serializedJson = try JSONSerialization.jsonObject(with: data)
                        print(serializedJson)
                        let jSonData = try JSONDecoder().decode(Categories.self, from: data)
                        completion(jSonData)
                    } catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchAPIProducts(completion: @escaping (AllProducts) -> Void){
        let url = "https://fakestoreapi.com/products"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        guard let data = data else {
                            print("Data is nil")
                            return
                        }
//                        let serializedJson = try JSONSerialization.jsonObject(with: data)
//                        print("seris=",serializedJson)
                        let jSonData = try JSONDecoder().decode(AllProducts.self, from: data)
                        print("testing=",jSonData)
                        completion(jSonData)
                    } catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchAPIUser(completion: @escaping (Users) -> Void){
        let url = "https://fakestoreapi.com/users/"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jSonData = try JSONDecoder().decode(Users.self, from: data!)
//                        print("fetchAbilities=",jSonData)
                        completion(jSonData)
                    } catch{
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }

    
}
