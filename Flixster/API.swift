//
//  API.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/23/23.
//

import Foundation

func decodeAPIResponseAndHandleResponse<T>(with url: URL, andCall fn: @escaping (_ response: T) -> Void) throws
where T: Decodable
{
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
            fatalError("Network error: \(error.localizedDescription)")
        }
        guard let data = data else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let response = try decoder.decode(T.self, from: data)
            DispatchQueue.main.async { fn(response) }
        } catch {
            fatalError("Parse error: \(error.localizedDescription)")
        }
    }
    
    task.resume()
}