//
//  Extension.swift
//  Uikit2344
//
//  Created by Apple on 20/01/2023.
//

import Foundation


extension String {
    func capitalizedfirstletter() ->  String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
