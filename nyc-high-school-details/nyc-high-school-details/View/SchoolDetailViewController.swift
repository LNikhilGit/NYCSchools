//
//  SchoolDetailViewController.swift
//  nyc-high-school-details
//
//  Created by Nikhil Lalam on 11/4/23.
//

import UIKit

class SchoolDetailViewController: UIViewController {
    
    var schoolInfo:School?
    var schoolTestResult:SchoolTestResult?
    
    @IBOutlet weak var name:UILabel!{
        didSet{
            name.text = schoolInfo?.name
        }
    }
    
   
    @IBOutlet weak var overView:UITextView!{
        didSet{
            overView.text = schoolInfo?.overview
        }
    }
    
    @IBOutlet weak var reading:UILabel!{
        didSet{
            if let totalReading = schoolTestResult?.satCriticalReadingAvgScore{
                reading.text = String(totalReading)
            }
        }
    }
    
        @IBOutlet weak var math:UILabel!{
            didSet{
                if let totalMath = schoolTestResult?.satMathAvgScore{
                    math.text = String(totalMath)
                }
            }
        }
    
    
            @IBOutlet weak var writing:UILabel!{
                didSet{
                    if let totalWriting = schoolTestResult?.satWritingAvgScore{
                        writing.text = String(totalWriting)
                    }
                }
            }
    
    @IBOutlet weak var total:UILabel!{
        didSet{
            if let totalReading = schoolTestResult?.satCriticalReadingAvgScore,
               let totalMath = schoolTestResult?.satMathAvgScore,
               let totalWriting = schoolTestResult?.satWritingAvgScore{
                let sum = (totalReading + totalMath + totalWriting)
                total.text = String(sum)
            }
        }
    }
     
    
        @IBOutlet weak var testtakers:UILabel!{
            didSet{
                if let totalTesttakers = schoolTestResult?.numOfSatTestTakers{
                    testtakers.text = String(totalTesttakers)
                }
            }
        }
    
    @IBOutlet weak var borough: UILabel!{
        didSet{
            borough.text = schoolInfo?.borough?.capitalized
        }
    }
    
    @IBOutlet weak var students: UILabel! {
        didSet{
            if let totalStudents = schoolInfo?.totalStudents{
                students.text = String(totalStudents)
            }
        }
    }
    
    @IBOutlet weak var graduation: UILabel!{
        didSet{
            if let graduationRate = schoolInfo?.graduationRate {
                graduation.text = String(round(graduationRate*100))
            }
        }
    }
    
    @IBOutlet weak var attendance: UILabel!{
        didSet{
            if let attendanceRate = schoolInfo?.attendanceRate{
                 attendance.text = String(round(attendanceRate*100))
            }
        }
    }
    
    
    @IBOutlet weak var phoneImageView: UIImageView!{
        didSet{
            setupImageView(phoneImageView)
        }
    }
    
    @IBOutlet weak var linkImageView: UIImageView!{
        didSet{
            setupImageView(linkImageView)
        }
    }
    
    @IBOutlet weak var mapImageView: UIImageView!{
        didSet{
            setupImageView(mapImageView)
        }
    }
    
    @IBOutlet weak var mailImageView: UIImageView!{
        didSet{
            setupImageView(mailImageView)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapPhone(_ sender: UITapGestureRecognizer){
        print("did tap phone", sender)
        if let phoneNumber = schoolInfo?.phoneNumber,
           let url = URL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url)
        }
        
    }
    @IBAction func didTapLink(_ sender: UITapGestureRecognizer){
        print("did tap link", sender)
        if let website = schoolInfo?.website,
           let url = URL(string: "http://\(website)") {
            UIApplication.shared.open(url)
        }
        
    }
    @IBAction func didTapMap(_ sender: UITapGestureRecognizer){
        print("did tap map", sender)
        if let latitute = schoolInfo?.latitude,
           let longitude = schoolInfo?.longitude,
           let url = URL(string: "maps://?q=School&ll=\(latitute),\(longitude)") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func didTapMail(_ sender: UITapGestureRecognizer) {
        print("did tap mail", sender)
        if let email = schoolInfo?.email,
           let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    func setupImageView(_ imageView: UIImageView){
        imageView.layer.backgroundColor = UIColor.systemGray5.cgColor
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
    }
}

