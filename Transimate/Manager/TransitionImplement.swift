//
//  TransitionImplement.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

public class TransitionImplement: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 0.8
    var isPush = false

    public init(operation: UINavigationControllerOperation) {
        guard operation != .none else { return }
        isPush = operation.rawValue % 2 != 0
    }

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) { }
}
