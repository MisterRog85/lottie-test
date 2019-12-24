//
//  ViewController.swift
//  test-lottie
//
//  Created by William Tomas on 29/11/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import UIKit
import Lottie

/**
 Application de test pour le pod Lottie permettant d'intégrer des animations à une appli iOS.
 */

class ViewController: UIViewController {
        
    //création des animationview, on passe en param le nom de l'animation (sans l'extension)
    let animationView = AnimationView(name: "outline")
            
    var played: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        staticAnim()
    }

    //coeur fixe
    func staticAnim() {
        
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.backgroundColor = .purple
        animationView.contentMode = .scaleAspectFill
        //animationView.makeCircular()
        self.view.addSubview(animationView)

        let gesture = UITapGestureRecognizer(target: self, action: #selector (actionAnim(_:)))

        animationView.addGestureRecognizer(gesture)

    }

    //animation pour le dislike
    func reverseAnim() {
        staticAnim()
        //animationViewReverse.play()
        animationView.play(fromProgress: 1, toProgress: 0)

    }

    //animation
    func playAnim() {
        staticAnim()
        animationView.play(fromProgress: 0, toProgress: 1)
    }
    
    @objc func actionAnim(_ gestureRecognizer:UITapGestureRecognizer) {
          if played {
              reverseAnim()
              played = false
          } else {
             playAnim()
              played = true
          }
    }
}

