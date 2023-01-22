//
//  Ext + UIView.swift
//  Dicee-iOS13
//
//  Created by Владимир Смирнов on 22.01.2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import UIKit

extension UIView {
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
