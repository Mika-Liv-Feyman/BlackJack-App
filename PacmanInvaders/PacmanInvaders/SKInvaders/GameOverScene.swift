//
//  GameOverScene.swift
//  PacmanSpaceInvaders
//
//  Created by Liv-Feyman, Michaella on 4/9/19.
//  Copyright © 2019 Liv-Feyman, Michaella. All rights reserved.
import UIKit
import SpriteKit
import AVFoundation
class GameOverScene: SKScene {
   
  var contentCreated = false
  //  lazy var backgroundMusic: AvaudioPlayer? = { guard let url = Bundle.main.url(forResource: "Intro.mp3")}
    
    private var PacmanGif = SKSpriteNode()
    private var PacmanGifWalkingFrames: [SKTexture] = []
  
  override func didMove(to view: SKView) {
   
    if (!self.contentCreated) {
      self.createContent()
      self.contentCreated = true
    }
    
    theScore = 0
    buildPacmanGif()
    animatePacmanGif()
    }

    func buildPacmanGif() {
        let PacmanGifAnimatedAtlas = SKTextureAtlas(named: "PacmanGif")
        var walkFrames: [SKTexture] = []
        
        let numImages = PacmanGifAnimatedAtlas.textureNames.count
        for i in 1...numImages {
            let PacmanGifTextureName = "\(i)"
            walkFrames.append(PacmanGifAnimatedAtlas.textureNamed(PacmanGifTextureName))
        }
        PacmanGifWalkingFrames = walkFrames
        let firstFrameTexture = PacmanGifWalkingFrames[0]
        PacmanGif = SKSpriteNode(texture: firstFrameTexture)
        PacmanGif.position = CGPoint(x: frame.midX, y: self.size.height - 80)
        addChild(PacmanGif)

    }

    func animatePacmanGif() {
        PacmanGif.run(SKAction.repeatForever(SKAction.animate(with: PacmanGifWalkingFrames, timePerFrame: 0.75, resize: true, restore: true)), withKey:"walkingInPlacePacmanGif")
    }
   
    
  func createContent() {
 //run(SKAction.repeatForever(SKAction.playSoundFileNamed("Intro.mp3", waitForCompletion: false)))
    
  run(SKAction.playSoundFileNamed("Intro.mp3", waitForCompletion: false))
    
    
    
    let gameOverLabel = SKLabelNode(fontNamed: "Courier")
    gameOverLabel.fontSize = 50
    gameOverLabel.fontColor = SKColor.red
    gameOverLabel.text = "Game Over!"
    gameOverLabel.position = CGPoint(x: self.size.width/2, y: 2.0 / 3.0 * self.size.height);
    self.addChild(gameOverLabel)
    
    
    let scoreLabel = SKLabelNode(fontNamed: "Courier")
    scoreLabel.fontSize = 20
    scoreLabel.fontColor = SKColor.white
    scoreLabel.text = "Your Current Score is:"
    scoreLabel.position = CGPoint(x: self.size.width/2, y: gameOverLabel.frame.origin.y - gameOverLabel.frame.size.height - 20);
    self.addChild(scoreLabel)
    
    let scoreNumLabel = SKLabelNode(fontNamed: "Courier")
    scoreNumLabel.fontSize = 40
    scoreNumLabel.fontColor = SKColor.blue
    scoreNumLabel.text = "\(theScore)"
    scoreNumLabel.position = CGPoint(x: self.size.width/2, y: scoreLabel.frame.origin.y - scoreLabel.frame.size.height - 40);
    self.addChild(scoreNumLabel)
    
    let highScoreLabel = SKLabelNode(fontNamed: "Courier")
    highScoreLabel.fontSize = 20
    highScoreLabel.fontColor = SKColor.white
    highScoreLabel.text = "Your High Score is:"
    highScoreLabel.position = CGPoint(x: self.size.width/2, y: scoreNumLabel.frame.origin.y - scoreNumLabel.frame.size.height - 20);
    self.addChild(highScoreLabel)
    
    let highScoreNumLabel = SKLabelNode(fontNamed: "Courier")
    highScoreNumLabel.fontSize = 40
    highScoreNumLabel.fontColor = SKColor.purple
    highScoreNumLabel.text = "\(highScore)"
    highScoreNumLabel.position = CGPoint(x: self.size.width/2, y: highScoreLabel.frame.origin.y - highScoreLabel.frame.size.height - 40);
    
    self.addChild(highScoreNumLabel)
    
    
    let tapLabel = SKLabelNode(fontNamed: "Courier")
    tapLabel.fontSize = 25
    tapLabel.fontColor = SKColor.green
    tapLabel.text = "(Tap to Play Again)"
    tapLabel.position = CGPoint(x: self.size.width/2, y: highScoreNumLabel.frame.origin.y - highScoreNumLabel.frame.size.height - 50);
    
    self.addChild(tapLabel)
    
    // black space color
    self.backgroundColor = SKColor.black
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)  {
    
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)  {
    
    
    let gameScene = GameScene(size: self.size)
    gameScene.scaleMode = .aspectFill
    
    self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontal(withDuration: 1.0))
    
  }
}
