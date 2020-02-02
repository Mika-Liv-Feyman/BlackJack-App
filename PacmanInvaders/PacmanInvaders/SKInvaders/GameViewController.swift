//
//  GameViewController.swift
//  PacmanSpaceInvaders
//
//  Created by Liv-Feyman, Michaella on 4/9/19.
//  Copyright © 2019 Liv-Feyman, Michaella. All rights reserved.
//Code for the game basics of the game (part I): https://www.raywenderlich.com/1167-how-to-make-a-game-like-space-invaders-with-spritekit-and-swift-part-1
//Code for the game basics of the game (part II): https://www.raywenderlich.com/1163-how-to-make-a-game-like-space-invaders-with-spritekit-and-swift-part-2
//Saving the highscore with user defaults: https://stackoverflow.com/questions/47572789/save-and-add-integer-value-in-userdefaults-and-retrieve-after-adding-the-value
//Sounds: https://downloads.khinsider.com/game-soundtracks/album/pac-man-game-sound-effects
//Making the sounds run: https://stackoverflow.com/questions/26915390/how-would-i-repeat-an-action-forever-in-swift
//Lonnie taught me command shift 3 to take a screenshot for my gif
//I used this website to learn how to make a gif/animation: https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift


import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure the view.
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = true
    
    // Create and configure the scene.
    let scene = GameScene(size: skView.frame.size)
    skView.presentScene(scene)
    
    // Pause the view (and thus the game) when the app is interrupted or backgrounded
    NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  @objc func handleApplicationWillResignActive (_ note: Notification) {
    let skView = self.view as! SKView
    skView.isPaused = true
  }
  
  @objc func handleApplicationDidBecomeActive (_ note: Notification) {
    let skView = self.view as! SKView
    skView.isPaused = false
  }
  
}
