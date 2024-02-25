//
//  API.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/23.
//

import Foundation
import Moya
import SwiftyJSON
import UIKit
import ObjectMapper

enum APIResponse<T> {
    case success(T)
    case error(MoyaError)
}

var endpointClosure: (API) -> Endpoint {
    return { (target: API) -> Endpoint in
        let url = URL(target: target).absoluteString
        return Endpoint(url: url,
                        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
}

let provider = MoyaProvider<API>(endpointClosure: endpointClosure)

enum API {
    case searchWeekly(targetDt: String, weekGb: String)
    case searchMovieInfo(movieCd: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://kobis.or.kr/kobisopenapi/webservice") else {
            fatalError("Invalid base URL")
        }
        
        return url
    }

    var path: String {
        switch self {
        case .searchWeekly:
            return "/rest/boxoffice/searchWeeklyBoxOfficeList.json"
        case .searchMovieInfo:
            return "/rest/movie/searchMovieInfo.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchWeekly, .searchMovieInfo: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .searchWeekly(let targetDt, let weekGb):
            var param: [String: Any] = [:]
            param["key"] = "f5eef3421c602c6cb7ea224104795888"
            param["targetDt"] = targetDt
            param["weekGb"] = weekGb
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case .searchMovieInfo(let movieCd):
            var param: [String: Any]  = [:]
            param["key"] = "f5eef3421c602c6cb7ea224104795888"
            param["movieCd"] = movieCd
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

private func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

extension MoyaProvider {
    func responseMapObject(target: API, response: Response, completionHandler: @escaping (_ result: APIResponse<Any>) -> Void) {
        switch target {
        case .searchWeekly:
            guard let responseModel = try? response.mapObject(SearchWeekly.self) else {
                return
            }
            completionHandler(APIResponse.success(responseModel))
        case .searchMovieInfo:
            guard let responseModel = try? response.mapObject(SearchMovieInfo.self) else {
                return
            }
            completionHandler(APIResponse.success(responseModel))
        }
    
    }
    
    func request(target: API, completionHandler: @escaping (_ result: APIResponse<Any>) -> Void) {
        provider.request(target, completion: { result in
            switch result {
            case let .success(response):
                let json = JSON(response.data)
                guard json.isEmpty else {
                    self.responseMapObject(target: target, response: response, completionHandler: completionHandler)
                    return
                }
                fatalError("JSON mapping failure")
                
            case let .failure(error):
                self.showFailureAlert(target: target, completionHandler: completionHandler)
                completionHandler(.error(error))
            }
        })
    }
    
    private func showFailureAlert(target: API, completionHandler: @escaping (_ result: APIResponse<Any>) -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "알림",
                message: "네트워크 상태가 불안정 합니다.\n네트워크 상태를 확인해 주세요.",
                preferredStyle: .alert)
            let retryAction = UIAlertAction(
                title: "재시도",
                style: .default) { _ in
                self.request(target: target, completionHandler: completionHandler)
            }
            let closeAction = UIAlertAction(
                title: "앱 종료",
                style: .default) { _ in
                exit(0)
            }
            alert.addAction(closeAction)
            alert.addAction(retryAction)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension Response {
    func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}

extension ImmutableMappable {
    static func new(json: [String: Any]) -> Self {
        let map = Map(mappingType: .fromJSON, JSON: json)
        return try! Self(map: map)
    }
}
