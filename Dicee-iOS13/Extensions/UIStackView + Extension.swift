//
//  UIStackView + Extension.swift
//  Dicee-iOS13
//
//  Created by Владимир Смирнов on 22.01.2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import UIKit

extension UIStackView {
  

  func addArrangedSubviews(_ views: [UIView]) {
      views.forEach { addArrangedSubview($0) }
  }
}

