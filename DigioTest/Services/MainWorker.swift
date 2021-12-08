//
//  MainWorker.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

protocol MainWorkerProtocol {
    func getData(_ completion: @escaping (_ response: Response<HomeModel.Data?>) -> Void)
}

class MainWorker: MainWorkerProtocol {
    
    init() {}
    
    func getData(_ completion: @escaping (_ response: Response<HomeModel.Data?>) -> Void) {
        guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                  error == nil else {
                      print(error?.localizedDescription ?? "Response Error")
                      return }
            do {
                let decoder = JSONDecoder()
                let response = try? decoder.decode(HomeModel.Data.self, from: dataResponse)
                
                if let response = response {
                    completion(.success(model: response))
                } else {
                    print("Not possible to parse...")
                }
                
            } catch let parsingError {
                print("Sorray... The data could not be parsed for some reason.", parsingError)
            }
        }
        task.resume()
    }
}
