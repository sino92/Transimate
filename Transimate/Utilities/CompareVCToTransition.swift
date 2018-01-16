//
//  CompareVCToTransition.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import Foundation

public protocol CompareViewControllersToTransitions {}
extension CompareViewControllersToTransitions {

    func transitionType(for vcTypePair: VCTypePair) -> TransitionType? {
        return TransimatePicker.transitionPairs
            .filter { $1.contains { $0 == vcTypePair } }
            .first?.key
    }
}
