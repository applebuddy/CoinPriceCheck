//
//  APIData.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//


import UIKit

class TradeResponse: Codable {
    let status: String
    let data: TradeData
}

class TradeData: Codable {
    let btc, eth, dash, ltc: TradeDataOptions
    let etc, xrp, bch, xmr: TradeDataOptions
    let zec, qtum, btg, eos: TradeDataOptions
    let icx, vet, trx, elf: TradeDataOptions
    let mith, mco, omg, knc: TradeDataOptions
    let gnt, zil, ethos, pay: TradeDataOptions
    let wax, powr, lrc, gto: TradeDataOptions
    let steem, strat, zrx, rep: TradeDataOptions
    let ae, xem, snt, ada: TradeDataOptions
    let ppt, ctxc, cmt, theta: TradeDataOptions
    let wtc, itc, dataTRUE, abt: TradeDataOptions
    let rnt, ply, waves, link: TradeDataOptions
    let enj, pst, salt, rdn: TradeDataOptions
    let loom, pivx, ins, bcd: TradeDataOptions
    let bznt, xlm, ocn, bsv: TradeDataOptions
    let tmtg, bat, wet, xvg: TradeDataOptions
    let iost, poly, hc, rom: TradeDataOptions
    let amo, etz, arn, apis: TradeDataOptions
    let mtl, dacc, dac, bhp: TradeDataOptions
    let btt, hdac, npxs, auto: TradeDataOptions
    let gxc, orbs, valor, con: TradeDataOptions
    let ankr, mix: TradeDataOptions
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
        case eth = "ETH"
        case dash = "DASH"
        case ltc = "LTC"
        case etc = "ETC"
        case xrp = "XRP"
        case bch = "BCH"
        case xmr = "XMR"
        case zec = "ZEC"
        case qtum = "QTUM"
        case btg = "BTG"
        case eos = "EOS"
        case icx = "ICX"
        case vet = "VET"
        case trx = "TRX"
        case elf = "ELF"
        case mith = "MITH"
        case mco = "MCO"
        case omg = "OMG"
        case knc = "KNC"
        case gnt = "GNT"
        case zil = "ZIL"
        case ethos = "ETHOS"
        case pay = "PAY"
        case wax = "WAX"
        case powr = "POWR"
        case lrc = "LRC"
        case gto = "GTO"
        case steem = "STEEM"
        case strat = "STRAT"
        case zrx = "ZRX"
        case rep = "REP"
        case ae = "AE"
        case xem = "XEM"
        case snt = "SNT"
        case ada = "ADA"
        case ppt = "PPT"
        case ctxc = "CTXC"
        case cmt = "CMT"
        case theta = "THETA"
        case wtc = "WTC"
        case itc = "ITC"
        case dataTRUE = "TRUE"
        case abt = "ABT"
        case rnt = "RNT"
        case ply = "PLY"
        case waves = "WAVES"
        case link = "LINK"
        case enj = "ENJ"
        case pst = "PST"
        case salt = "SALT"
        case rdn = "RDN"
        case loom = "LOOM"
        case pivx = "PIVX"
        case ins = "INS"
        case bcd = "BCD"
        case bznt = "BZNT"
        case xlm = "XLM"
        case ocn = "OCN"
        case bsv = "BSV"
        case tmtg = "TMTG"
        case bat = "BAT"
        case wet = "WET"
        case xvg = "XVG"
        case iost = "IOST"
        case poly = "POLY"
        case hc = "HC"
        case rom = "ROM"
        case amo = "AMO"
        case etz = "ETZ"
        case arn = "ARN"
        case apis = "APIS"
        case mtl = "MTL"
        case dacc = "DACC"
        case dac = "DAC"
        case bhp = "BHP"
        case btt = "BTT"
        case hdac = "HDAC"
        case npxs = "NPXS"
        case auto = "AUTO"
        case gxc = "GXC"
        case orbs = "ORBS"
        case valor = "VALOR"
        case con = "CON"
        case ankr = "ANKR"
        case mix = "MIX"
        case date
    }
}

class TradeDataOptions: Codable {
    let openingPrice: String
    let closingPrice: String
    let minPrice: String
    let maxPrice: String
    let averagePrice: String
    let tradedUnits: String
    let volumePer1Day: String
    let volumePer7Day: String
    let buyPrice: String
    let sellPrice: String
    let fluctateIn24H: String
    let fluctateRateIn24H: String
    
    enum CodingKeys: String, CodingKey {
        case openingPrice = "opening_price"
        case closingPrice = "closing_price"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case averagePrice = "average_price"
        case tradedUnits = "units_traded"
        case volumePer1Day = "volume_1day"
        case volumePer7Day = "volume_7day"
        case buyPrice = "buy_price"
        case sellPrice = "sell_price"
        case fluctateIn24H = "24H_fluctate"
        case fluctateRateIn24H = "24H_fluctate_rate"
    }
}

///// MARK: - TradeData Responses
//struct TradeDetailResponse: Codable {
//    let status: String
//    let data: DataClass
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseDataClass { response in
////     if let dataClass = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    let timestamp, paymentCurrency: String
//    let btc, eth, dash, ltc: Curruncy
//    let etc, xrp, bch, xmr: Curruncy
//    let zec, qtum, btg, eos: Curruncy
//    let icx, vet, trx, elf: Curruncy
//    let mith, mco, omg, knc: Curruncy
//    let gnt, zil, ethos, pay: Curruncy
//    let wax, powr, lrc, gto: Curruncy
//    let steem, strat, zrx, rep: Curruncy
//    let ae, xem, ada, snt: Curruncy
//    let ppt, ctxc, cmt, theta: Curruncy
//    let bat, wtc, itc, salt: Curruncy
//    let loom, pst, rnt, dataTRUE: Curruncy
//    let abt, bcd, link, poly: Curruncy
//    let waves, enj, ply, mtl: Curruncy
//    let rdn, ins, iost, ocn: Curruncy
//    let tmtg, bznt, arn, hdac: Curruncy
//    let npxs, wet, amo, bsv: Curruncy
//    let rom, apis, dacc, dac: Curruncy
//    let auto, orbs, valor, con: Curruncy
//    let ankr, mix, hc, xvg: Curruncy
//    let xlm, pivx, etz, gxc: Curruncy
//    let bhp, btt: Curruncy
//
//    enum CodingKeys: String, CodingKey {
//        case timestamp
//        case paymentCurrency = "payment_currency"
//        case btc = "BTC"
//        case eth = "ETH"
//        case dash = "DASH"
//        case ltc = "LTC"
//        case etc = "ETC"
//        case xrp = "XRP"
//        case bch = "BCH"
//        case xmr = "XMR"
//        case zec = "ZEC"
//        case qtum = "QTUM"
//        case btg = "BTG"
//        case eos = "EOS"
//        case icx = "ICX"
//        case vet = "VET"
//        case trx = "TRX"
//        case elf = "ELF"
//        case mith = "MITH"
//        case mco = "MCO"
//        case omg = "OMG"
//        case knc = "KNC"
//        case gnt = "GNT"
//        case zil = "ZIL"
//        case ethos = "ETHOS"
//        case pay = "PAY"
//        case wax = "WAX"
//        case powr = "POWR"
//        case lrc = "LRC"
//        case gto = "GTO"
//        case steem = "STEEM"
//        case strat = "STRAT"
//        case zrx = "ZRX"
//        case rep = "REP"
//        case ae = "AE"
//        case xem = "XEM"
//        case ada = "ADA"
//        case snt = "SNT"
//        case ppt = "PPT"
//        case ctxc = "CTXC"
//        case cmt = "CMT"
//        case theta = "THETA"
//        case bat = "BAT"
//        case wtc = "WTC"
//        case itc = "ITC"
//        case salt = "SALT"
//        case loom = "LOOM"
//        case pst = "PST"
//        case rnt = "RNT"
//        case dataTRUE = "TRUE"
//        case abt = "ABT"
//        case bcd = "BCD"
//        case link = "LINK"
//        case poly = "POLY"
//        case waves = "WAVES"
//        case enj = "ENJ"
//        case ply = "PLY"
//        case mtl = "MTL"
//        case rdn = "RDN"
//        case ins = "INS"
//        case iost = "IOST"
//        case ocn = "OCN"
//        case tmtg = "TMTG"
//        case bznt = "BZNT"
//        case arn = "ARN"
//        case hdac = "HDAC"
//        case npxs = "NPXS"
//        case wet = "WET"
//        case amo = "AMO"
//        case bsv = "BSV"
//        case rom = "ROM"
//        case apis = "APIS"
//        case dacc = "DACC"
//        case dac = "DAC"
//        case auto = "AUTO"
//        case orbs = "ORBS"
//        case valor = "VALOR"
//        case con = "CON"
//        case ankr = "ANKR"
//        case mix = "MIX"
//        case hc = "HC"
//        case xvg = "XVG"
//        case xlm = "XLM"
//        case pivx = "PIVX"
//        case etz = "ETZ"
//        case gxc = "GXC"
//        case bhp = "BHP"
//        case btt = "BTT"
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responsePuneHedgehog { response in
////     if let puneHedgehog = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - PuneHedgehog
//struct Curruncy: Codable {
//    let orderCurrency: String
//    let bids, asks: [Ask]
//
//    enum CodingKeys: String, CodingKey {
//        case orderCurrency = "order_currency"
//        case bids, asks
//    }
//}
//
//// MARK: - Ask
//struct Ask: Codable {
//    let quantity, price: String
//}
//
//
//struct BithumbList: Codable {
//    let orderCurrency: String
//
//    enum CodingKeys: String, CodingKey {
//        case orderCurrency = "order_currency"
//    }
//}
