//
//  Navigation.swift
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import Foundation
import UIKit

enum AppStoryboard : String {
  case Main
    
  var shared : UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
    
}

extension UIViewController {
    static func initFromStoryboard(_ board: AppStoryboard) -> UIViewController {
        return board.shared.instantiateViewController(withIdentifier: "\(self)")
    }
}
