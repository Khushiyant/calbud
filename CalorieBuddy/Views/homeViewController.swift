//
//  homeViewController.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 21/07/22.
//

import Foundation
import UIKit
import Charts

class homeViewController : UIViewController, ChartViewDelegate {
    
    private let urlString = "http://127.0.0.1:8000/tip/"
    
    private lazy var header : appHeader = {
        
        let head = appHeader()
        head.translatesAutoresizingMaskIntoConstraints = false
        return head
    }()
    
    private let slogan :  UIStackView = {
       
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let month : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.textColor = .white
        
        return label
        
    }()
 
    
    private let weight : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        
        return label
    }()

    private let graphArea : UIView  = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 227.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 5, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 0
        
   
        return view
    }()
    
    private let barChart : BarChartView = {
        let chart = BarChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    private let tipView : UIStackView = {
       
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        
        let headerView = UIStackView()
        headerView.distribution = .fillProportionally
        
        
        let image = UIImageView()
        image.image = UIImage(named: "edit")
        image.contentMode = .scaleAspectFit
        
        let labelFit = UILabel()
        labelFit.text = "FIT TIP OF THE DAY"
        labelFit.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        
        headerView.addArrangedSubview(image)
        headerView.addArrangedSubview(labelFit)
        
        view.addArrangedSubview(headerView)
        return view
    }()
    
    var tipResult : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(header)
        view.addSubview(slogan)
        view.addSubview(month)
        view.addSubview(weight)
        view.addSubview(graphArea)
        
        view.addSubview(tipView)
        
        
        dataFetch()
        setupLayout()
    }
    fileprivate func setupLayout(){
        
//        Header Configuration
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive  = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
//        Slogan Stack View
        slogan.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slogan.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30).isActive = true
        
        let labelStart = UILabel()
        labelStart.text = "Get, Set,"
        labelStart.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        
        let labelTrack = UILabel()
        labelTrack.text = "Track"
        labelTrack.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        labelTrack.textColor = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        labelTrack.shadowColor = UIColor.black
        labelTrack.shadowOffset = .init(width: 3, height: 3)
        
        slogan.addArrangedSubview(labelStart)
        slogan.addArrangedSubview(labelTrack)
        
//        Graph Area config
        graphArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        graphArea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive  = true
        graphArea.topAnchor.constraint(equalTo: slogan.bottomAnchor, constant: 20).isActive = true
        graphArea.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        month.text = "\(dateFormatter.string(from: Date()))"
        month.topAnchor.constraint(equalTo: graphArea.topAnchor, constant: 10).isActive = true
        month.leadingAnchor.constraint(equalTo: graphArea.leadingAnchor, constant: 10).isActive = true
        
        weight.text = "75KGs"
        weight.topAnchor.constraint(equalTo: month.bottomAnchor).isActive = true
        weight.leadingAnchor.constraint(equalTo: graphArea.leadingAnchor, constant: 10).isActive = true
        
        
        //        Bar Chart config
        var entries = [BarChartDataEntry]()
        
        for x in 0..<100 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 1...1000)))
        }
        
        let set = BarChartDataSet()
        set.colors = ChartColorTemplates.pastel()
        let data = BarChartData(dataSet: set)
        
        barChart.frame = CGRect(x: 0, y: 0, width: graphArea.frame.size.width, height: graphArea.frame.size.height)
        barChart.data = data
        barChart.center = graphArea.center
        
        
        graphArea.addSubview(month)
        graphArea.addSubview(weight)
        graphArea.addSubview(barChart)

        
//        Tip view config
        tipView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        tipView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        tipView.topAnchor.constraint(equalTo: graphArea.bottomAnchor, constant: 20).isActive = true
        
        let labeltip = UILabel()
        
        labeltip.text = tipResult
        tipView.addArrangedSubview(labeltip)
    }
    
    fileprivate func dataFetch(){
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in guard let  data = data, error == nil else {return}
            do {
                let jsonResult = try JSONDecoder().decode(GraphAPIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self?.tipResult = jsonResult.result.tip
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
