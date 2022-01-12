//
//  QiitaAPI.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/11.
//

import Foundation

enum QiitaError: Error {
  case error
}

protocol QiitaAPIProtocol: AnyObject {
  func get(result: ((Result<[QiitaModel], QiitaError>) -> Void)?)
}

final class QiitaAPI: QiitaAPIProtocol {
  static let shared = QiitaAPI()
  private init() {}

  func get(result: ((Result<[QiitaModel], QiitaError>) -> Void)? = nil) {
    let url = URL(string: "https://qiita.com/api/v2/items")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard
        let data = data,
        let models = try? JSONDecoder().decode([QiitaModel].self, from: data)
      else {
        result?(.failure(.error))
        return
      }
      result?(.success(models))
    }
    task.resume()
  }
}
