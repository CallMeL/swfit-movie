//
//  loadImage.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/14.
//

import Foundation
import SwiftUI
//load image:
extension String{
    func loadImage() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            let data:Data = try Data(contentsOf: url)
            return UIImage(data:data) ?? UIImage()
        } catch  {
            
        }
        return UIImage()
    }
}
