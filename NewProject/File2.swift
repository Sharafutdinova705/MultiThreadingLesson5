//
//  File2.swift
//  NewProject
//
//  Created by Гузель on 29.10.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import UIKit

class ViewControllerUtils: NSObject {
    
    /// метод для шаринга с помощью UIActivityViewController
    ///
    /// - Parameters:
    ///   - textOfPostLabel: Текст поста
    ///   - currentViewController: Контроллер NewsViewController
    func shareAction(textOfPostLabel: UILabel, currentViewController: UIViewController) {
        var defaultMessage = "default"
        if textOfPostLabel.text != nil {
            defaultMessage = textOfPostLabel.text!
        }
        let activityController = UIActivityViewController(activityItems: [defaultMessage], applicationActivities: nil)
        currentViewController.present(activityController, animated: true, completion: nil)
    }
}
