//
//  DataManagerImplementation.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

class DataManagerImplementation: DataManager {
    
    
    static var sharedInstance : DataManager = DataManagerImplementation()
    
    var postArr = [Post]()
    
    lazy var additingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.additingOperationQueue"
        return queue
    }()
    
    lazy var removingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.removingOperationQueue"
        return queue
    }()
    
    lazy var searchingOperationQueue: OperationQueue = {
        let queue =  OperationQueue()
        queue.name = "com.DataManagerImplemetion.searchingOperationQueue"
        return queue
    }()
    
    private init() {
        fillData()
    }
    
    /// Заполнение массива
    func fillData() {
        let post1 = Post(id: 0, name: "Kitty", avatar: #imageLiteral(resourceName: "kitty"), description: nil, someImage: #imageLiteral(resourceName: "kitty"))
        let post2 = Post(id: 1, name: "My paper", avatar: #imageLiteral(resourceName: "avatar"), description: "SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE SALE ", someImage: #imageLiteral(resourceName: "paper"))
        let post3 = Post(id: 2, name: "Chill", avatar: #imageLiteral(resourceName: "avatar"), description: "October calendar", someImage: #imageLiteral(resourceName: "calendarw"))
        postArr = [post1, post2, post3]
        
    }
    
    
    
    
    /// Асинхронное добавление моделт
    ///
    /// - Parameters:
    ///   - post:
    ///   - completion:
    func addAsync(post: Post, completion: @escaping (Bool) -> Void) {
        additingOperationQueue.addOperation {
            self.postArr.append(post)
            completion(true)
        }
    }
    
    /// Синхронное добавление поста
    ///
    /// - Parameter post:
    /// - Returns:
    func addSync(post: Post) -> Bool {
        postArr.append(post)
        return true
    }
    
    /// Асинхронное удаление поста
    ///
    /// - Parameters:
    ///   - id:
    ///   - completion:
    func removeAsync(by id: Int, completion: @escaping (Bool) -> Void) {
        removingOperationQueue.addOperation {
            
            if let i = self.postArr.index(where: { $0.id == id }) {
                self.postArr.remove(at: i)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    /// Синхронное добавление поста
    ///
    /// - Parameter id:
    /// - Returns:
    func removeSync(by id: Int) -> Bool {
        if let i = self.postArr.index(where: { $0.id == id }) {
            self.postArr.remove(at: i)
            return true
        } else {
            return false
        }
    }
    
    /// Асинхронный поиск ро айди
    ///
    /// - Parameters:
    ///   - id:
    ///   - completion:
    func searchAsync(by id: Int, completion: @escaping (Post?) -> Void) {
        searchingOperationQueue.addOperation {
            if let post = self.postArr.first(where: {$0.id == id}) {
                completion(post)
            } else {
                completion(nil)
            }
            
        }
    }
    
    /// Синхронный поиск поста
    ///
    /// - Parameter id:
    /// - Returns:
    func searchSync(by id: Int) -> Post? {
        if let post = postArr.first(where: {$0.id == id}) {
            return post
        } else {
            return nil
        }
    }
    
    
    /// Все посты
    ///
    /// - Returns: Возвращает массив всех постов
    func all() -> [Post] {
        return postArr
    }
    
    
    /// Асинхронный вызов всех постов
    ///
    /// - Parameter completion:
    func all(completion: @escaping ([Post]) -> Void) {
        searchingOperationQueue.addOperation {
            completion(self.postArr)
        }
    }
}
