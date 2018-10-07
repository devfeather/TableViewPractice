//
//  NetworkManager.swift
//  TableViewPractice
//
//  Created by feather on 2018. 9. 28..
//  Copyright © 2018년 Feather. All rights reserved.
//

import UIKit

class NetworkManager {
    typealias CompletionHandler = (_ response: Data?) -> ()
    static let shared = NetworkManager()
    
    private init() {
        print("Singleton Initialized")
    }
}

extension NetworkManager {
    enum Router {
        case tableKind
        case contact
        case menu
        
        var path: String {
            switch self {
            case .tableKind: return "table_kind"
            case .contact: return "contact"
            case .menu: return "menu"
            }
        }
    }
}

extension NetworkManager {
    private func loadData(router: Router) -> Data? {
        guard let dataAsset = NSDataAsset(name: router.path) else { return nil }
        return dataAsset.data
    }
    
    private func request(router: Router, delay: DispatchTime,completion: @escaping CompletionHandler) {
        DispatchQueue.global().asyncAfter(deadline: delay) { [weak self] in
            guard let self = self else { return }
            guard let response = self.loadData(router: router) else {
                completion(nil)
                return
            }
            completion(response)
        }
    }
    
    func requestTableList(delay: DispatchTime,completion: @escaping CompletionHandler) {
        request(router: .tableKind, delay: delay, completion: completion)
    }
    
    func requestContactList(delay: DispatchTime,completion: @escaping CompletionHandler) {
        request(router: .contact, delay: delay, completion: completion)
    }
    
    func requestMenuList(delay: DispatchTime,completion: @escaping CompletionHandler) {
        request(router: .menu, delay: delay, completion: completion)
    }
}
