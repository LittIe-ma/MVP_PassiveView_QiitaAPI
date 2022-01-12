//
//  File.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/12.
//

import Foundation

protocol QiitaPresenterInput {
  var numberOfModels: Int { get }
  func didSelect(index: Int)
  func qiitaModel(index: Int) -> QiitaModel
  func fetchQiitaArticle()
}

protocol QiitaPresenterOutput: AnyObject {
  func updateModels(_ models: [QiitaModel])
}

final class QiitaPresenter: QiitaPresenterInput {

  private weak var output: QiitaPresenterOutput!
  private var api: QiitaAPIProtocol!
  private var models: [QiitaModel]

  init(output: QiitaPresenterOutput, api: QiitaAPIProtocol = QiitaAPI.shared) {
    self.output = output
    self.api = api
    self.models = []
  }

  var numberOfModels: Int { models.count }

  func qiitaModel(index: Int) -> QiitaModel { models[index]}

  func didSelect(index: Int) {
    print(models[index])
  }

  func fetchQiitaArticle() {
    self.api.get { [weak self] (result) in
      switch result {
      case .success(let models):
        DispatchQueue.main.async {
          self?.models = models
          self?.output.updateModels(models)
        }
      case .failure(let error):
        print("error ", error)
        break
      }
    }
  }
}
