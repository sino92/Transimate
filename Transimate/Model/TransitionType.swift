//
//  TransitionType.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

public enum TransitionType {
    case vertical
    case zoom
}

extension TransitionType {
    func transition(operation: UINavigationControllerOperation) -> TransitionImplement? {
        switch self {
        case .vertical:
            return VerticalTransition(operation: operation)
        case .zoom:
            return ZoomTransition(operation: operation)
        }
    }
}
