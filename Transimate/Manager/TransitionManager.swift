//
//  TransitionManager.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

final public class TransitionManager: NSObject, UINavigationControllerDelegate, CompareViewControllersToTransitions {

    public func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationControllerOperation,
        from fromVC: UIViewController, to toVC: UIViewController
        ) -> UIViewControllerAnimatedTransitioning? {

        let fromVCType = type(of: fromVC)
        let toVCType = type(of: toVC)
        let _transitionType = transitionType(for: (fromVCType, toVCType))
        let transitionImplement = _transitionType?.transition(operation: operation)
        return transitionImplement
    }
}
