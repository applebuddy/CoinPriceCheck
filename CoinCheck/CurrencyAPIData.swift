//
//  APIData.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

// MARK: - APIData

// API 주소 URL 정보
// "https://api.bithumb.com/public/orderbook/ALL"
// "https://api.bithumb.com/public/ticker/ALL"

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

    var arr: [TradeDataOptions] {
        return [btc, eth, dash, ltc, etc, xrp, bch, xmr, zec, qtum, btg, eos, icx, vet, trx, elf, mith, mco, omg, knc, gnt, zil, ethos, pay, wax, powr, lrc, gto, steem, strat, zrx, rep, ae, xem, snt, ada, ppt, ctxc, cmt, theta, wtc, itc, dataTRUE, abt, rnt, ply, waves, link, enj, pst, salt, rdn, loom, pivx, ins, bcd, bznt, xlm, ocn, bsv, tmtg, bat, wet, xvg, iost, poly, hc, rom, amo, etz, arn, apis, mtl, dacc, dac, bhp, btt, hdac, npxs, auto, gxc, orbs, valor, con, ankr, mix]
    }

    enum CodingKeys: String, CodingKey {
        case btc = "BTC", eth = "ETH", dash = "DASH", ltc = "LTC", etc = "ETC"
        case xrp = "XRP", bch = "BCH", xmr = "XMR", zec = "ZEC", qtum = "QTUM"
        case btg = "BTG", eos = "EOS", icx = "ICX", vet = "VET", trx = "TRX"
        case elf = "ELF", mith = "MITH", mco = "MCO", omg = "OMG", knc = "KNC"
        case gnt = "GNT", zil = "ZIL", ethos = "ETHOS", pay = "PAY", wax = "WAX"
        case powr = "POWR", lrc = "LRC", gto = "GTO", steem = "STEEM", strat = "STRAT"
        case zrx = "ZRX", rep = "REP", ae = "AE", xem = "XEM", snt = "SNT"
        case ada = "ADA", ppt = "PPT", ctxc = "CTXC", cmt = "CMT", theta = "THETA"
        case wtc = "WTC", itc = "ITC", dataTRUE = "TRUE", abt = "ABT", rnt = "RNT"
        case ply = "PLY", waves = "WAVES", link = "LINK", enj = "ENJ", pst = "PST"
        case salt = "SALT", rdn = "RDN", loom = "LOOM", pivx = "PIVX", ins = "INS"
        case bcd = "BCD", bznt = "BZNT", xlm = "XLM", ocn = "OCN", bsv = "BSV"
        case tmtg = "TMTG", bat = "BAT", wet = "WET", xvg = "XVG", iost = "IOST"
        case poly = "POLY", hc = "HC", rom = "ROM", amo = "AMO", etz = "ETZ"
        case arn = "ARN", apis = "APIS", mtl = "MTL", dacc = "DACC", dac = "DAC"
        case bhp = "BHP", btt = "BTT", hdac = "HDAC", npxs = "NPXS", auto = "AUTO"
        case gxc = "GXC", orbs = "ORBS", valor = "VALOR", con = "CON", ankr = "ANKR"
        case mix = "MIX"
        case date
    }
}

class TradeDataOptions: Codable {
    let openingPrice, closingPrice, minPrice, maxPrice: String
    let unitsTraded, accTradeValue, prevClosingPrice, unitsTraded24H: String
    let accTradeValue24H, fluctate24H, fluctateRate24H: String

    var optionArr: [String] {
        return [openingPrice, closingPrice, minPrice, maxPrice, unitsTraded, accTradeValue, prevClosingPrice, unitsTraded24H, accTradeValue24H, fluctate24H, fluctateRate24H]
    }

    enum CodingKeys: String, CodingKey {
        case openingPrice = "opening_price"
        case closingPrice = "closing_price"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case unitsTraded = "units_traded"
        case accTradeValue = "acc_trade_value"
        case prevClosingPrice = "prev_closing_price"
        case unitsTraded24H = "units_traded_24H"
        case accTradeValue24H = "acc_trade_value_24H"
        case fluctate24H = "fluctate_24H"
        case fluctateRate24H = "fluctate_rate_24H"
    }
}

struct CurrencyDataResponse: Codable {
    let status: String
    let data: CurrencyData
}

struct CurrencyData: Codable {
    let openingPrice, closingPrice, minPrice, maxPrice: String
    let unitsTraded, accTradeValue, prevClosingPrice, unitsTraded24H: String
    let accTradeValue24H, fluctate24H, fluctateRate24H, date: String

    var optionArr: [String] {
        return [openingPrice, closingPrice, minPrice, maxPrice, unitsTraded, accTradeValue, prevClosingPrice, unitsTraded24H, accTradeValue24H, fluctate24H, fluctateRate24H, date]
    }

    enum CodingKeys: String, CodingKey {
        case openingPrice = "opening_price"
        case closingPrice = "closing_price"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case unitsTraded = "units_traded"
        case accTradeValue = "acc_trade_value"
        case prevClosingPrice = "prev_closing_price"
        case unitsTraded24H = "units_traded_24H"
        case accTradeValue24H = "acc_trade_value_24H"
        case fluctate24H = "fluctate_24H"
        case fluctateRate24H = "fluctate_rate_24H"
        case date
    }
}
