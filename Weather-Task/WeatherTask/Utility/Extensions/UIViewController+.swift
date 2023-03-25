//
//  UIViewController+.swift
//  Weather
//
//  Created by prem on 25/3/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
