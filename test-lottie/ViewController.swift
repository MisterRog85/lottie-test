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
    let animationViewReverse = AnimationView(name: "outline-reverse")
            
    var played: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        staticAnim(played)
    }

    //coeur fixe
    func staticAnim(_ type: Bool) {
        if !type {
            animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            animationView.center = self.view.center
            animationView.backgroundColor = .purple
            animationView.contentMode = .scaleAspectFill
            //animationView.makeCircular()
            self.view.addSubview(animationView)

            let gesture = UITapGestureRecognizer(target: self, action: #selector (actionAnim(_:)))

            animationView.addGestureRecognizer(gesture)
        } else {
            animationViewReverse.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            animationViewReverse.center = self.view.center
            animationViewReverse.backgroundColor = .purple
            animationViewReverse.contentMode = .scaleAspectFill
            //animationView.makeCircular()
            self.view.addSubview(animationViewReverse)

            let gesture = UITapGestureRecognizer(target: self, action: #selector (actionAnim(_:)))

            animationViewReverse.addGestureRecognizer(gesture)
        }

    }

    //animation pour le dislike
    func reverseAnim() {
        staticAnim(played)
        animationViewReverse.play()
    }

    //animation
    func playAnim() {
        staticAnim(played)
        animationView.play()
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

