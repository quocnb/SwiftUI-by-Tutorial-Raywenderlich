//
//  TimeCounter.swift
//  RBBullsEye
//
//  Created by Quoc Nguyen on 2020/06/01.
//  Copyright © 2020 Quoc Nguyen. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    private var timer: Timer?
    @Published var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc private func updateCounter() {
        counter += 1
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
