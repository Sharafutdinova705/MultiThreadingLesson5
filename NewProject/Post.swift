//
//  Post.swift
//  NewProject
//
//  Created by Гузель on 04.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation
import UIKit

struct Post {
    
    /// id
    var id: Int
    /// название группы
    var name: String
    /// аватар группы
    var avatar: UIImage
    /// описание поста
    var description: String?
    /// изображение, прикрепленное к посту
    var someImage: UIImage?
}
