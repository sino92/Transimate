//
//  VCTuple.swift
//  Transimate
//
//  Created by Sinan Eren on 1/16/18.
//  Copyright © 2018 Sinan Eren. All rights reserved.
//

import UIKit

public func == <T:Equatable> (
    tuple1: (T.Type,T.Type),
    tuple2: (T.Type,T.Type)
    ) -> Bool {
    return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}

public typealias VCTypePair = (UIViewController.Type,UIViewController.Type)
