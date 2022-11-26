//
//  ViewController.swift
//  week9
//
//  Created by 이예나 on 11/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    let session = URLSession(configuration: .default)
    var urlComponents = URLComponents(string: "http://apis.data.go.kr/1613000/SubwayInfoService/getKwrdFndSubwaySttnList")!
    let subwayStationName = URLQueryItem(name: "subwayStationName", value: "강남")
    let serviceKeyString = "mPhXAs36Nf%2BDBsH8w%2FP6a0B8pOIahp%2FwdXt8%2B3XXMcnpjp7peChrCG22dN4hIWG6K5FYd8goFk4ei08O5qI4ew%3D%3D"
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
    var serviceKey: URLQueryItem {
        .init(name: "serviceKey", value: serviceKeyString)
    }
    
    let type = URLQueryItem(name: "_type", value: "json")
    override func viewDidLoad() {
        super.viewDidLoad()
        startNetworking()
    }
    
    func startNetworking() {
        let queryItems: [URLQueryItem] = [subwayStationName, serviceKey, type]
        urlComponents.queryItems = queryItems
        let requestURL = urlComponents.url!
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                    successRange.contains(statusCode),
                  let resultData = data
            else { return }
            guard let dataModelResponse = try? JSONDecoder().decode(DataModel.self, from: resultData)
            else { self.startNetworking(); return}
            dataModelResponse.response.body.items.item.forEach { print($0) }
        }
        
        dataTask.resume()
        
    }
    
}
