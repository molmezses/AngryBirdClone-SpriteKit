//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by mustafa ölmezses on 8.09.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    
    //var bird2 = SKSpriteNode()
    
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    
    var gameStarted = false
    var originalPosition : CGPoint?
    
    
    enum colliderType : UInt32 {
        case bird = 1
        case box = 2
    }

    
    
    override func didMove(to view: SKView) {
        
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: self.frame.width / 15, height: self.frame.height / 12)
        bird2.zPosition = 1
        self.addChild(bird2)
        */
        
        //label
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 62
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0 , y: self.frame.height / 4)
        scoreLabel.zPosition = 3
        
        addChild(scoreLabel)
        
        
        
        //box
        
        let boxTexture = SKTexture(imageNamed: "box")
        let size = CGSize(width: boxTexture.size().width / 1.5, height: boxTexture.size().height / 1.5)
        
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.affectedByGravity = true //tıklandıktan sonra yer cekimi açmak için bburda false degeri veiroyrtuz
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.mass = 0.4
        
        box1.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.mass = 0.4
        
        box2.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.mass = 0.4
        
        box3.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.mass = 0.4
        
        box4.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.mass = 0.4
        
        box5.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.mass = 0.4
       
        box6.physicsBody?.collisionBitMask = colliderType.bird.rawValue
        
        
        
        //bird
        bird = childNode(withName:"bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")

        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().width / 20 )

        bird.physicsBody?.affectedByGravity = false //tıklandıktan sonra yer cekimi açmak için bburda false degeri veiroyrtuz
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.12// kusun kilosu kg
        
        
        originalPosition = bird.position
        
        
        
        
        // çaprışma algılayılar
        
        bird.physicsBody?.contactTestBitMask = colliderType.bird.rawValue
        bird.physicsBody?.collisionBitMask = colliderType.box.rawValue
        bird.physicsBody?.categoryBitMask = colliderType.bird.rawValue
        
        // physics body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        bird.physicsBody?.affectedByGravity = true
        */
        
        
        if gameStarted == false {
            
            if let touch = touches.first{
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode{
                            
                            if sprite == bird {
                                
                                bird.position = touchLocation
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first{
            
            let touchLocation = touch.location(in: self)
            let touchNodes = nodes(at: touchLocation)
            
            if touchNodes.isEmpty == false {
                
                for node in touchNodes {
                    
                    if let sprite = node as? SKSpriteNode{
                        
                        if sprite == bird {
                            
                            bird.position = touchLocation
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first{
            
            let touchLocation = touch.location(in: self)
            let touchNodes = nodes(at: touchLocation)
            
            if touchNodes.isEmpty == false {
                
                for node in touchNodes {
                    
                    if let sprite = node as? SKSpriteNode{
                        
                        if sprite == bird {
                            
                            let dx  = -(touchLocation.x - originalPosition!.x)
                            let dy = -(touchLocation.y - originalPosition!.y)
                            
                            
                            let impulse = CGVector(dx: dx, dy: dy)
                            
                            
                            bird.physicsBody?.applyImpulse(impulse)
                            bird.physicsBody?.affectedByGravity = true
                            
                            
                            gameStarted = true
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == colliderType.bird.rawValue || contact.bodyB.collisionBitMask == colliderType.bird.rawValue{
           
            score += 1
            scoreLabel.text = String(score)
            
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // devamlı kontrol edilecek
        // kusun hızı duserse al kusu basa geri koy
        
        if let birdPhysicsBody = bird.physicsBody {
            
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                gameStarted = false
                
            }
            
        }
        
    }
    
    
    
    
}
