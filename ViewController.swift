import UIKit

class ViewController: UIViewController {
    var nextTag = 0
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var nextTappedButton: UIButton!
    var timer:Timer!
    var timer_sec:Float = 0
    @IBOutlet weak var imageView: UIImageView!
    let image1 = UIImage(named:"images.jpg")
    let image2 = UIImage(named:"images (1).png")
    let image3 = UIImage(named:"download-1.jpg")
    let image4 = UIImage(named:"download.jpg")
    let image5 = UIImage(named:"images.png")
    
    
    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageView.image = image1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(self.nextTap)))
    }
    

    
    
    @IBAction func nextTap(_ sender: Any) {
        let storyboard:UIStoryboard = self.storyboard!
        let nextVC = storyboard.instantiateViewController(withIdentifier: "showSegue") as! NextViewController
        nextVC.getImage = imageView.image!
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    
    @objc func update() {
        self.timer_sec += 0.1
        
        
        if timer_sec <= 2.0 {
            imageView.image = image1
        }else if timer_sec <= 4.0 {
            imageView.image = image2
        }else if timer_sec <= 6.0 {
            imageView.image = image3
        }else if timer_sec <= 8.0 {
            imageView.image = image4
        }else if timer_sec <= 10.0 {
            imageView.image = image5
        }
        
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        let imageArray = [image1,image2,image3,image4,image5]
        
        imageView.image = imageArray[nextTag]
        nextTag += 1
        
        if nextTag == 5 {
            nextTag = 0
        }
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        let imageArray = [image1,image2,image3,image4,image5]
        imageView.image = imageArray[nextTag]
        nextTag -= 1
        if nextTag < 0 {
            nextTag = 4
        }
        
    }
    
    
    @IBAction func gostopButton(_ sender: Any) {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            self.nextTappedButton.isEnabled = false
            self.back.isEnabled = false
            
        }else if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.timer_sec = 0
            self.nextTappedButton.isEnabled = true
            self.back.isEnabled = true
        }
        
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
}



