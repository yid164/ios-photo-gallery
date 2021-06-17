//
//  ImageModel.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-16.
//

import Foundation
import SwiftUI

struct ImageModel: Hashable {
    let date: String
    let beforeImage: UIImage
    let afterImage: UIImage
    
    static var smaples: [ImageModel?] = [
        ImageModel(date: "April 10, 2021", beforeImage: UIImage(imageLiteralResourceName: "p1.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p2.HEIC")),
        ImageModel(date: "April 11, 2021", beforeImage: UIImage(imageLiteralResourceName: "p3.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p4.HEIC")),
        ImageModel(date: "April 12, 2021", beforeImage: UIImage(imageLiteralResourceName: "p5.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p6.HEIC")),
        ImageModel(date: "April 13, 2021", beforeImage: UIImage(imageLiteralResourceName: "p7.JPG"), afterImage: UIImage(imageLiteralResourceName: "p8.JPG")),
        ImageModel(date: "April 14, 2021", beforeImage: UIImage(imageLiteralResourceName: "p9.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p10.HEIC")),
        ImageModel(date: "April 15, 2021", beforeImage: UIImage(imageLiteralResourceName: "p11.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p12.HEIC")),
        ImageModel(date: "April 16, 2021", beforeImage: UIImage(imageLiteralResourceName: "p13.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p14.HEIC")),
        ImageModel(date: "April 17, 2021", beforeImage: UIImage(imageLiteralResourceName: "p15.JPG"), afterImage: UIImage(imageLiteralResourceName: "p16.HEIC")),
        ImageModel(date: "April 18, 2021", beforeImage: UIImage(imageLiteralResourceName: "p17.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p18.HEIC")),
        ImageModel(date: "April 19, 2021", beforeImage: UIImage(imageLiteralResourceName: "p19.HEIC"), afterImage: UIImage(imageLiteralResourceName: "p20.HEIC")),
        nil
    ]
    
    
}

