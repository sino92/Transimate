//
//  TransimatePicker.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import Foundation

public struct TransimatePicker {

    static fileprivate(set) var transitionPairs: [TransitionType : [VCTypePair]] = [:]

    public func add(transitionPairArray: [TransitionType : [VCTypePair]]) {
        transitionPairArray.forEach { (type, vcPair) in
            TransimatePicker.transitionPairs.updateValue(vcPair, forKey: type)
        }
    }
}
