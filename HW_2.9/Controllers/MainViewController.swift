//
//  ViewController.swift
//  HW_2.9
//
//  Created by Beelab_ on 24/11/21.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var currentAnimationLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var forceValueLabel: UILabel!
    @IBOutlet weak var delayValueLabel: UILabel!
    
    @IBOutlet weak var nextAnimationButton: UIButton!
    @IBOutlet weak var animatedView: SpringImageView!
    
    private var animation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation = getNextAnimation()
    }

    @IBAction func nextAnimationButtonPressed(_ sender: UIButton) {
        
        animatedView.animation = animation.animation
        animatedView.curve = animation.curve
        animatedView.duration = animation.duration
        animatedView.force = animation.force
        animatedView.delay = animation.delay
        animatedView.animate()
        
        setLabelsValue(animation)
        
        animation = getNextAnimation()
        nextAnimationButton.setTitle("Next: \(animation.animation)", for: .normal)
    }
    
    private func setLabelsValue (_ animation: Animation){
        currentAnimationLabel.text = "present: \(animation.animation)"
        curveLabel.text = "curve: \(animation.curve)"
        durationValueLabel.text = "duration: \(animation.duration)"
        forceValueLabel.text = "force: \(animation.force)"
        delayValueLabel.text = "delay: \(animation.delay)"
    }
    
    private func getNextAnimation() -> Animation {
        let animations = Spring.AnimationPreset.allCases
        let animationCurves = Spring.AnimationCurve.allCases
        
        let animation = Animation(animation: animations[Int.random(in: 0..<animations.count)].rawValue,
                                  curve: animationCurves[Int.random(in: 0..<animationCurves.count)].rawValue,
                                  duration: CGFloat(Int.random(in: 10...100))/100,
                                  force: CGFloat(Int.random(in: 10...100))/100,
                                  delay: CGFloat(Int.random(in: 10...100))/100)
        return animation
    }
}

