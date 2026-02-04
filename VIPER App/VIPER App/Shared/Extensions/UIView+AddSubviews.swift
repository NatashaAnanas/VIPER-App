//
//  UIView+AddSubviews.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 04.02.2026.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
