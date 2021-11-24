//
//  Animation.swift
//  HW_2.9
//
//  Created by Beelab_ on 24/11/21.
//

import Spring

struct Animation {
    let animation: String
    let curve: String
    let duration: CGFloat
    let force: CGFloat
    let delay: CGFloat
}

extension Animation{
    static func getNextAnimation() -> Animation {
        let animations = Spring.AnimationPreset.allCases
        let animationCurves = Spring.AnimationCurve.allCases
        
        let animation = Animation(animation: animations[Int.random(in: 0..<animations.count)].rawValue,
                                  curve: animationCurves[Int.random(in: 0..<animationCurves.count)].rawValue,
                                  duration: CGFloat(Int.random(in: 100...500))/100,
                                  force: CGFloat(Int.random(in: 10...100))/100,
                                  delay: CGFloat(Int.random(in: 100...200))/100)
        return animation
    }
}
