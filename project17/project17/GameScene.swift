//
//  GameScene.swift
//  project17
//
//  Created by Robin van Meeuwen on 14/09/2021.
//

import SpriteKit
import UIKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scorelabel: SKLabelNode!
    
    var possibleEnemies = [ "ball", "hammer", "tv"]
    var gameTimer: Timer?
    var isGameOver = false
    var score = 0 {
        didSet{
            scorelabel.text = "Score: \(score)"
        }
    }
    
        
    
    override func didMove(to view: SKView) {
        
        
        
        super.didMove(to: view)
        
        
            backgroundColor = .black
            
            starfield = SKEmitterNode(fileNamed: "starfield")!
            starfield.position = CGPoint(x: 1024, y: 384)
            starfield.advanceSimulationTime(10)
            addChild(starfield)
            starfield.zPosition = -1
            
            player = SKSpriteNode(imageNamed: "player")
            player.position = CGPoint(x: 100, y: 384)
            player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
            player.physicsBody?.contactTestBitMask = 1
            addChild(player)
            
            scorelabel = SKLabelNode(fontNamed: "Chalkduster")
            scorelabel.position = CGPoint(x: 16, y: 16)
            scorelabel.horizontalAlignmentMode = .left
            addChild(scorelabel)
            
            score = 0
            
            physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
            
            gameTimer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
       

            
       
    }
    
    @objc func createEnemy() {
            guard let enemy = possibleEnemies.randomElement() else {return}
            
            let sprite = SKSpriteNode(imageNamed: enemy)
            sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...736))
            addChild(sprite)
        
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
        sprite.physicsBody?.angularVelocity = 5
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularDamping = 0
        }
    

    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }

        if !isGameOver {
            score += 1
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        var location = touch.location(in: self)
        
        if location.y < 100 {
            location.y = 100
        }else if location.y > 668 {
            location.y = 668
        }
        player.position = location
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let explosion = SKEmitterNode(fileNamed: "explosion" )!
        explosion.position = player.position
        addChild(explosion)
        
        player.removeFromParent()
        isGameOver = true
        gameTimer?.invalidate()
        
        let gameOverLabel = SKLabelNode(fontNamed: "Helvetica")
        gameOverLabel.name = "gameOverLabel"
        gameOverLabel.fontSize = 30
        gameOverLabel.text = "Game Over! Tap to play again."
        gameOverLabel.position = CGPoint(x: 512, y: 387)
        gameOverLabel.zPosition = 1
        gameOverLabel.isUserInteractionEnabled = true
        addChild(gameOverLabel)
        
        restartGame()
        
    }
    

    
    
    
    
    
    
    
    func restartGame() {
        removeAllChildren()
  //      startGame()
    }
}
