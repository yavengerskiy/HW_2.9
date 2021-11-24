//
//  ViewController.swift
//  HW_2.9
//
//  Created by Beelab_ on 24/11/21.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var currentAnimationLabel: UILabel!
    
    @IBOutlet weak var nextAnimationButton: UIButton!
    @IBOutlet weak var animatedView: SpringImageView!
    
    private var animation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation = Animation.getNextAnimation()
    }

    @IBAction func nextAnimationButtonPressed(_ sender: UIButton) {
        
        animatedView.animation = animation.animation
        animatedView.curve = animation.curve
        animatedView.duration = animation.duration
        animatedView.force = animation.force
        animatedView.delay = animation.delay
        animatedView.animate()
        
        setLabelsValue(animation)
        
        animation = Animation.getNextAnimation()
        nextAnimationButton.setTitle("Next: \(animation.animation)", for: .normal)
    }
    
    private func setLabelsValue (_ animation: Animation){
        currentAnimationLabel.text = "present: \(animation.animation)\n" +
                                     "curve: \(animation.curve)\n" +
                                     "duration: \(animation.duration)\n" +
                                     "force: \(animation.force) \n" +
                                     "delay: \(animation.delay)"
    }
    
    
}

