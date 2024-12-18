//
//  ServerCommunicator.swift
//  High Stakes
//
//  Created by Rehan Parwani on 12/16/24.
//

import Foundation

extension Data {
    
    /**
     printJSON()
     - MARK: prints the JSON response from an API response
     */
    fileprivate func printJson() {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                print("Invalid data")
                return
            }
            print(jsonString)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct ServerCommunicator {
    static let shared = ServerCommunicator()

    /**
     HTTPMethod
     - MARK: these are the http requests that can be made on DivvyPal's backend.
     */
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }

    /**
     Error
     - MARK: the Plaid backend has different error return values along with our own backend.
     */
    enum Error: LocalizedError {
        case invalidUrl(String)
        case networkError(String)
        case encodingError(String)
        case decodingError(String)
        case plaidLinkError
        case nilData

        var localizedDescription: String {
            switch self {
            case .invalidUrl(let url): return "Invalid URL: \(url)"
            case .networkError(let error): return "Network Error: \(error)"
            case .encodingError(let error): return "Encoding Error: \(error)"
            case .decodingError(let error): return "Decoding Error: \(error)"
            case .nilData: return "Server return null data"
            case .plaidLinkError: return "Issue with plaid link"
            }
        }

        var errorDescription: String? {
            return localizedDescription
        }
    }

    
    /**
     DEBUG: Meant for debugging purposes, when testing local backend server
     */
    init(baseURL: String = "http://192.168.1.111:8080/") {
        self.baseURL = baseURL
    }
    
    /**
     func callMyServer<T: Decodable>(path: String, httpMethod: HTTPMethod, params: [String:Any]?) -> T?
     - parameter path: This is the path for the API endpoint on our DivvyPal backend.
     - parameter httpMethod: This is the form of http request we will be making to our backend.
     - parameter params: This is the map of any parameters that can be passed for a POST request.
     - returns: Returns the type T specified in the header of the the method.
     */
    func callMyServer<T: Decodable>(
        path: String,
        httpMethod: HTTPMethod,
        params: [String: Any]? = nil) async throws -> T? {

            let path = path.hasPrefix("/") ? String(path.dropFirst()) : path
            let urlString = baseURL + path

            guard let url = URL(string: urlString) else {
                return nil
            }

            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")

            switch httpMethod {
            case .post where params != nil:
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: params!, options: [])
                    request.httpBody = jsonData
                } catch {
                    throw ServerCommunicator.Error.encodingError(error.localizedDescription)
                }
            default:
                break
            }
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            do {
                data.printJson()
                let object = try JSONDecoder().decode(T.self, from: data)
                return object

            } catch {
                throw ServerCommunicator.Error.decodingError(error.localizedDescription)
            }
    }

    /**
     func callMyServer<T: Decodable>(path: String, httpMethod: HTTPMethod, params: [String:Any]?, completion: (Result<T, ServerCommunicator.Error>) -> Void)
     - parameter path: This is the path for the API endpoint on our DivvyPal backend.
     - parameter httpMethod: This is the form of http request we will be making to our backend.
     - parameter params: This is the map of any parameters that can be passed for a POST request.
     - parameter completion: This is the method which will take two parameters and allow the method to be executed using these two parameters returned.
     - parameter T: The type of object which can be decoded from the api response from DivvyPal's backend.
     */
    func callMyServer<T: Decodable>(
        path: String,
        httpMethod: HTTPMethod,
        params: [String: Any]? = nil,
        completion: @escaping (Result<T, ServerCommunicator.Error>) -> Void) async throws {

            let path = path.hasPrefix("/") ? String(path.dropFirst()) : path
            let urlString = baseURL + path

            guard let url = URL(string: urlString) else {
                completion(.failure(ServerCommunicator.Error.invalidUrl(urlString)))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")

            switch httpMethod {
            case .post where params != nil:
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: params!, options: [])
                    request.httpBody = jsonData
                } catch {
                    completion(.failure(.encodingError("\(error)")))
                    return
                }
            default:
                break
            }
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))

            } catch {
                completion(.failure(.decodingError("\(error)")))
            }
    }

    private let baseURL: String
}
