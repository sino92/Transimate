//
//  ZoomTransition.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

final class ZoomTransition: TransitionImplement {

    let _originPoint: CGPoint

    public init(operation: UINavigationControllerOperation, originPoint: CGPoint = CGPoint(x: 0, y: 0)) {
        _originPoint = originPoint
        super.init(operation: operation)
    }

    override public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let containerView = transitionContext.containerView
        guard let from = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let to = transitionContext.view(forKey: UITransitionContextViewKey.to)
            else { return }

        let viewToPresent = isPush ? to : from
        let viewCenterFrame = CGRect(x: _originPoint.x, y: _originPoint.y, width: 1, height: 1)
        let initialFrame = isPush ? viewCenterFrame : viewToPresent.frame
        let finalFrame = isPush ? viewToPresent.frame : viewCenterFrame

        let xScaleFactor = isPush ? (initialFrame.width / finalFrame.width) : (finalFrame.width / initialFrame.width)
        let yScaleFactor = isPush ? (initialFrame.height / finalFrame.height) : (finalFrame.height / initialFrame.height)
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

        if isPush {
            viewToPresent.transform = scaleTransform
            viewToPresent.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            viewToPresent.clipsToBounds = true
        }

        containerView.addSubview(to)
        containerView.bringSubview(toFront: viewToPresent)

        UIView.animate(
            withDuration: duration,
            animations: {
                viewToPresent.transform = self.isPush ? CGAffineTransform.identity : scaleTransform
                viewToPresent.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        }
        )
    }
}

