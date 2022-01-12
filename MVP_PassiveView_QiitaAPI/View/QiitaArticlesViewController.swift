//
//  QiitaArticlesViewController.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/11.
//

import UIKit

final class QiitaArticlesViewController: UIViewController {

  private var tableView: UITableView = UITableView()

  private var presenter: QiitaPresenter!
  func inject(presenter: QiitaPresenter) {
    self.presenter = presenter
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    presenter.fetchQiitaArticle()
  }
}

extension QiitaArticlesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter.didSelect(index: indexPath.row)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    45
  }
}

extension QiitaArticlesViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.numberOfModels
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: QiitaArticleCell.self.description()) as? QiitaArticleCell else {
      fatalError()
    }
    let qiitaModel = presenter.qiitaModel(index: indexPath.row)
    cell.configure(qiitaModel: qiitaModel)
    return cell
  }
}

extension QiitaArticlesViewController: QiitaPresenterOutput {
  func updateModels(_ models: [QiitaModel]) {
    self.tableView.reloadData()
  }
}

extension QiitaArticlesViewController {
  func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(QiitaArticleCell.self, forCellReuseIdentifier: QiitaArticleCell.self.description())
    self.view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
    ])
  }
}
