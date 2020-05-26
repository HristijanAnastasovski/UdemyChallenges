//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var currentStory: Story?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentStory = storyBrain.stories[0]
        updateUI()
    }

    @IBAction func choiceButtonClicked(_ sender: UIButton) {
        currentStory = storyBrain.getNextStory(currentChoiceMade: sender.title(for: .normal)!)
        updateUI()
        
    }
    
    func updateUI(){
        if let story = currentStory {
            storyLabel.text = story.title
            choice1Button.setTitle(story.choice1, for: .normal)
            choice2Button.setTitle(story.choice2, for: .normal)
        }
    }
    
}

