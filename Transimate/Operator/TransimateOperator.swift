//
//  TransimateOperator.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import Foundation

precedencegroup Directionality {
    associativity: left
}

infix operator <-- : Directionality
infix operator --> : Directionality

public func <-- (from: UIViewController.Type, to: UIViewController.Type) -> VCTypePair {
    return (to, from)
}

public func --> (from: UIViewController.Type, to: UIViewController.Type) -> VCTypePair {
    return (from, to)
}
