//
//  SchoolViewModel.swift
//  nyc-high-school-details
//
//  Created by Nikhil Lalam on 11/4/23.
//
import Foundation

class SchoolViewModel {
    struct Constant {
        static let schoolDirectoryURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        static let testResultURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
    
    let networkManager = NetworkManager()
    
    var schools = [School]()
    var schoolTestResults = [String: SchoolTestResult]()
    
    func fetchSchoolDirectory() async {
        
        do {
            let data = try await networkManager.fetchData(url: Constant.schoolDirectoryURL)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            schools = try jsonDecoder.decode([School].self, from: data)
            schools.sort { $0.name < $1.name }
        }
        catch {
            print("fetch data error:\(error)")
        }
    }
    
    func fetchSchoolTestResults() async {
        
        do {
            let data = try await networkManager.fetchData(url: Constant.testResultURL)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let results = try jsonDecoder.decode(SchoolTestResults.self, from: data)
            for result in results {
                schoolTestResults[result.dbn] = result
            }
        }
        catch {
            print("fetch data error:\(error)")
        }
    }
    
    func fetchSchoolsInfo() async {
        async let callSchools: () = fetchSchoolDirectory()
        async let callschoolResults: () = fetchSchoolTestResults()
        let _ = await [callSchools,callschoolResults]
            
    }
}
