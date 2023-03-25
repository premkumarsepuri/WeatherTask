//
//  Coordinator.swift
//  Weather
//
//  Created by prem on 25/3/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
