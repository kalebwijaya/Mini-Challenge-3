//
//  onboardingViewController.swift
//  MC2
//
//  Created by Michael Varian Sutanto on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class onboardingViewController: UIViewController, UIScrollViewDelegate, OnBoardingInputData {
    func didTap() {
        performSegue(withIdentifier: "toLogin", sender: self)
    }

    //create scroll view outlet
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
        scrollView.delegate = self
        }
    }
    
    //create page control outlet
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pushButton: UIButton!
    
    
    //create new variable called slides
    var slides : [Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)

    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.backgroundView.image = UIImage(named: "bg1")
        slide1.imageView.image = UIImage(named: "image_1")
        slide1.imageView.layer.cornerRadius = 15
        slide1.mainTitle.text = "Cating - Cat Mating Apps"
        slide1.descLabel.text = "Cating help you to find a mating partner for your cats"
        slide1.pushButton.isHidden = true
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.backgroundView.image = UIImage(named: "bg2")
        slide2.imageView.image = UIImage(named: "onboarding02")
        slide2.mainTitle.text = "Choose Your Cat"
        slide2.descLabel.text = "Create your cat profile then choose your cat that you want to find partner mating."
        slide2.pushButton.isHidden = true
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.backgroundView.image = UIImage(named: "bg3")
        slide3.imageView.image = UIImage(named: "onboarding03")
        slide3.mainTitle.text = "Find Their Match"
        slide3.descLabel.text = "You can see other people's cat profiles and choose partners for your cat."
        slide3.pushButton.isHidden = true
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.backgroundView.image = UIImage(named: "bg4")
        slide4.imageView.image = UIImage(named: "onboarding04")
        slide4.mainTitle.text = "Chat and Meet Up"
        slide4.descLabel.text = "You just need to 'Like' someone else's cat and wait for the cat owner to start chatting to you!"
        slide4.listener = self
        return [slide1, slide2, slide3, slide4]
        
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.3, y: percentOffset.x/0.3)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.9-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.34)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1.25-percentOffset.x)/0.25, y: (1.25-percentOffset.x)/0.25)
        }
    }
}

    protocol OnBoardingInputData {
        func didTap()
    }


