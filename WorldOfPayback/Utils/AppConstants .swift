//
//  AppConstants .swift
//  WorldOfPayback
//
//  Created by Merima Muhovic on 2. 5. 2023..
//

import Foundation
import UIKit

struct Design {
    struct Color {
        static let blue = UIColor.rgba(red: 3, green: 16, blue: 89, alpha: 1)
        static let red = UIColor.rgba(red: 255, green: 0, blue: 0, alpha: 1)
    }
    
    struct Font {
        struct Heading {
            static let Huge = UIFont.systemFont(ofSize: 69, weight: .bold)
            
        }
        struct Body {
            static let Body = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
    
}

struct Content {
    static let internetCheck = "Please check your internet connection and try again."
    static let isDeviceOffline = "Your device is offline."
    static let transaction = "Transactions"
    
}

struct API {
    // example: static let DB_REF = Firestore.firestore()
}
extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
