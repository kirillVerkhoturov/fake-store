//
//  IdRepository.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/11/22.
//

import Foundation

protocol SessionStorable: AnyObject {
    var userId: Int? { get set }
}

class SessionRepository: SessionStorable {

    // MARK: - Public Properties

    var userId: Int? {
        get {
            udWrapper.integer(forKey: SessionRepositoryKeys.userId.rawValue)
        }
        set {
            if let newValue = newValue {
                udWrapper.set(newValue, forKey: SessionRepositoryKeys.userId.rawValue)
            } else {
                udWrapper.removeObject(forKey: SessionRepositoryKeys.userId.rawValue)
            }
        }
    }

    // MARK: - Private Properties

    private let udWrapper: UserDefaults

    // MARK: - Initializers

    init(udWrapper: UserDefaults) {
        self.udWrapper = udWrapper
    }

}

extension SessionRepository {
    private enum SessionRepositoryKeys: String {
        case userId
    }
}
