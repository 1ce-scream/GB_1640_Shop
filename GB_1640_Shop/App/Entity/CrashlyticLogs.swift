//
//  CrashlyticLogs.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 28.04.2022.
//

import Foundation
import Firebase

enum LogType: String {
    case authSuccess = "Успешный вход"
    case authFail = "Неуспешный вход"
    case registration = "Регистрация"
    case goodsList = "Открытие списка товаров"
    case goodsDetail = "Открытие конкретного товара"
    case addToBasket = "Добавление товара в корзину"
    case removeFromBasket = "Удаление товара из корзины"
    case payBasket = "Оплату заказа"
    case sendReview = "Добавление отзыва"
}

extension Crashlytics {
    // swiftlint:disable identifier_name
    static func setLog(log: LogType) {
        self.crashlytics().log(log.rawValue)
    }
}
