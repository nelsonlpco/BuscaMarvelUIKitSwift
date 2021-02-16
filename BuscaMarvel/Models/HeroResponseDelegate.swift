//
//  HeroResponseDelegate.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 19/02/21.
//

import Foundation

protocol HeroResponseDelegate  {
    func onError(errorMessage: String)
    func onSuccess(data: HeroResponse)
}
