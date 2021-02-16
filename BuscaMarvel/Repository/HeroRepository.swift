//
//  HeroRepository.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 15/02/21.
//


import UIKit
import CryptoKit
import Alamofire

class HeroRepository: NSObject {
    private let PUBLIC_KEY = "8753d3f72d17692c327806bc8a360493"
    private let PRIVATE_KEY = "5cb82d4d6de8ff209bd7e6b3732cf258cadd59e3"
    
    private var delegate: HeroResponseDelegate?
    
    init(delegate: HeroResponseDelegate) {
        self.delegate = delegate
    }
    
    func buildMd5Hash(timeStamp: Double) -> String{
        
        let key = String(timeStamp)+PRIVATE_KEY+PUBLIC_KEY;
        
        let digest = Insecure.MD5.hash(data: key.data(using: .utf8) ?? Data())

        let md5HEX = digest.map {
                String(format: "%02hhx", $0)
            }.joined()
        
        return md5HEX
    }
    
    func getHeroesByOffset(offset: Int = 0) {
        let timeStamp = Date().timeIntervalSince1970
        let hash = buildMd5Hash(timeStamp: timeStamp)
        let api = "https://gateway.marvel.com/v1/public/characters?ts=\(timeStamp)&limit=\(4)&offset=\(offset)&apikey=\(PUBLIC_KEY)&hash=\(hash)"
        
        let request = AF.request(api)
        
        request.responseJSON(completionHandler: {response in
            
            switch response.result {
                case .success:
                    guard let jsonResponse = response.value as? Dictionary<String, Any> else { print("Falha ao converter dado"); return }
                    
                    guard let jsonData = jsonResponse["data"] as? Dictionary<String, Any> else { print("Falha ao converter dado da resposta"); return }
                    
                    let heroResponse = HeroResponse(jsonMap: jsonData)
                    
                    self.delegate?.onSuccess(data: heroResponse)
                        
                    print("Total: \(heroResponse.totalItens)")
                    
                    break
                case .failure(let error):
                    self.delegate?.onError(errorMessage: error.localizedDescription)
                    break
            }
            
        })

    }
    
}
