//
//  DataManager.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//


protocol DataManager {
    
    static var sharedInstance: DataManager { get }
    
    func addAsync(post: Post, completion: @escaping (Bool) -> Void)
    
    func addSync(post: Post) -> Bool
    
    func removeAsync(by id: Int, completion: @escaping (Bool) -> Void)
    
    func removeSync(by id: Int) -> Bool
    
    func searchAsync(by id: Int, completion: @escaping (Post?) -> Void)
    
    func searchSync(by id: Int) -> Post?
    
    func all() -> [Post]
    
    func all(completion: @escaping ([Post]) -> Void)
}
