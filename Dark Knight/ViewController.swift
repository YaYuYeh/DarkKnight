//
//  ViewController.swift
//  Dark Knight
//
//  Created by Ya Yu Yeh on 2022/8/4.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    @IBOutlet weak var batmanImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trilogyLabel: UILabel!
    @IBOutlet weak var trilogyNumLabel: UILabel!
    @IBOutlet weak var linesLabel: UILabel!
    @IBOutlet weak var changePC: UIPageControl!
        
    //電影圖片陣列
    let batman = ["first", "second", "third"]
    //電影名稱陣列
    let movieName = [
        "B  A  T  M  A  N       B  E  G  I  N  S", "T  H  E     D  A  R  K      K  N  I  G  H  T", "T H E   D A R K   K N I G H T   R I S E S"
    ]
    //電影系列內容、顏色陣列
    let trilogy = ["I", "I I", "I I I"]
    let trilogyColor = [UIColor(red: 236/255, green: 179/255, blue: 97/255, alpha: 1), UIColor(red: 170/255, green: 209/255, blue: 214/255, alpha: 1), UIColor(red: 170/255, green: 209/255, blue: 214/255, alpha: 1)]
    //經典台詞陣列
    let movieLines = [
        """
        It's not who I am underneath,
        but what I do, that defines me.
        - 2005
        """,
            
        """
        The night is darkest just before the dawn.
        And I promise you, the dawn is coming.
        - 2008
        """,
            
        """
        I do fear death.
         fear dying in here, while my city burns,
        and there’s no one there to save it.
        - 2012
        """
    ]
    //選擇頁面的索引值
    var selectedNumber = 0
    
    

    //將換頁效果放入函式
    func infoChange()
    {
        //trilogy文字顏色及陰影變換
        trilogyLabel.textColor = trilogyColor[selectedNumber]
        trilogyLabel.shadowColor = trilogyColor[selectedNumber]
        trilogyNumLabel.textColor = trilogyColor[selectedNumber]
        trilogyNumLabel.shadowColor = trilogyColor[selectedNumber]
        
        batmanImageView.image = UIImage(named: batman[selectedNumber])
        nameLabel.text = movieName[selectedNumber]
        trilogyNumLabel.text = trilogy[selectedNumber]
        linesLabel.text = movieLines[selectedNumber]
    }
    
    //上一頁
    @IBAction func prePress(_ sender: UIButton!)
    {
        selectedNumber -= 1
        if selectedNumber < 0
        {
            selectedNumber = batman.count-1
        }
        infoChange()
    }
    //下一頁
    @IBAction func nextPress(_ sender: Any)
    {
        selectedNumber = (selectedNumber + 1) % batman.count
        infoChange()
    }
    //滑動手勢上一頁
    @IBAction func preSwipe(_ sender: UISwipeGestureRecognizer)
    {
        prePress(nil)
    }
    //滑動手勢下一頁
    @IBAction func nextSwipe(_ sender: UISwipeGestureRecognizer)
    {
        nextPress(0)
    }

    //小圓點換頁
    @IBAction func pcSelect(_ sender: UIPageControl)
    {
        selectedNumber = changePC.currentPage
        infoChange()
    }
 
    //放入背景音樂
    var player:AVPlayer?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let batmanURl = Bundle.main.url(forResource: "Molossus", withExtension: "mp3")
        player = AVPlayer(url: batmanURl!)
        player?.play()
    }
}

