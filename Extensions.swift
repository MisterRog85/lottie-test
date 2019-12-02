//
//  Extensions.swift
//  test-lottie
//
//  Created by William Tomas on 29/11/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeCircular() {
        let cntr:CGPoint = self.center
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.center = cntr
    }
}
