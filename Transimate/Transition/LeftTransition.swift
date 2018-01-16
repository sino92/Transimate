//
//  LeftTransition.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

final public class LeftTransition: TransitionImplement {

    override public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let containerView = transitionContext.containerView
        guard let from = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let to = transitionContext.view(forKey: UITransitionContextViewKey.to)
            else { return }

        var horizontalDelta: CGFloat = 0
        let containerWidth = containerView.frame.size.width
        horizontalDelta = isPush ? containerWidth : -1 * containerWidth

        to.transform = CGAffineTransform(translationX: -horizontalDelta, y: 0)
        containerView.addSubview(to)

        UIView.animate(
            withDuration: duration,
            animations: {
                from.transform = CGAffineTransform(translationX: horizontalDelta, y: 0)
                to.transform = CGAffineTransform.identity
        },
            completion: { finished in
                from.removeFromSuperview()
                from.transform = CGAffineTransform.identity
                transitionContext.completeTransition(true)
        }
        )
    }
}
