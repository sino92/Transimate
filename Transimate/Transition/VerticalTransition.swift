//
//  VerticalTransition.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

final class VerticalTransition: TransitionImplement {

    override public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let containerView = transitionContext.containerView
        guard let from = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let to = transitionContext.view(forKey: UITransitionContextViewKey.to)
            else { return }

        var verticalDelta: CGFloat = 0
        let containerHeight = containerView.frame.size.height
        verticalDelta = isPush ? -1 * containerHeight : containerHeight

        to.transform = CGAffineTransform(translationX: 0, y: -verticalDelta)
        containerView.addSubview(to)

        UIView.animate(
            withDuration: duration,
            animations: {
                from.transform = CGAffineTransform(translationX: 0, y: verticalDelta)
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
