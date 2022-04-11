//
//  RequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)
}

// MARK: - Auth Factories

extension RequestFactory {
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }

    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }

    func makeLogOutRequestFactory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }

    func makeChangeUserDataFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }
}

// MARK: - Goods Factories

extension RequestFactory {
    func makeGoodsCatalogRequestFactory() -> GoodsCatalogRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser,
                     sessionManager: commonSession,
                     queue: sessionQueue)
    }
    
    func makeGoodRequestFactory() -> GoodRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser,
                     sessionManager: commonSession,
                     queue: sessionQueue)
    }
}

// MARK: - Review Factories

extension RequestFactory {
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    
    func makeApproveReviewRequestFactory() -> ApproveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    
    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    
    func makeGetReviewListByIdFactory() -> GetReviewListByIdFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
}

// MARK: - Basket Factories

extension RequestFactory {
    func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    
    func makeRemoveFromBasketRequestFactory() -> RemoveFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    
    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
}
