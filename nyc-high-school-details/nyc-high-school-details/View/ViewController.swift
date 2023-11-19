//
//  ViewController.swift
//  nyc-high-school-details
//
//  Created by Nikhil Lalam on 11/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let viewTitle = "NYCSchools"
        static let schoolDetailsSegue = "school-details"
    }
    
    @IBOutlet weak var tableView:UITableView!
    let viewModel = SchoolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.viewTitle
        tableView.dataSource = self
        tableView.delegate = self
        
         Task {
         await viewModel.fetchSchoolsInfo()
         self.tableView.reloadData()
         }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.schoolDetailsSegue {
            if let viewController = segue.destination as? SchoolDetailViewController,
               let cell = sender as? UITableViewCell,
               let index = tableView.indexPath(for: cell)?.row {
                viewController.schoolInfo = viewModel.schools[index]
                if let dbName = viewController.schoolInfo?.dbn {
                    
                    viewController.schoolTestResult = viewModel.schoolTestResults[dbName]
                }
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "school-cell", for: indexPath)
        cell.textLabel?.text = viewModel.schools[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}


