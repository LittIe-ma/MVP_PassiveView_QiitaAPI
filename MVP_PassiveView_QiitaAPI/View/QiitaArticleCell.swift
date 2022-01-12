//
//  QiitaArticleCell.swift
//  MVP_PassiveView_QiitaAPI
//
//  Created by yasudamasato on 2022/01/12.
//

import UIKit

final class QiitaArticleCell: UITableViewCell {

  let articleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    addSubview(articleLabel)
    [
      articleLabel.topAnchor.constraint(equalTo: self.topAnchor),
      articleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      articleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
      articleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
    ].forEach { $0.isActive = true }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(qiitaModel: QiitaModel) {
    articleLabel.text = qiitaModel.title
  }
}
