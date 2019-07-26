//
//  BithumbCurrencies.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 30/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum BithumbCurrencyName: String {
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
}

class BithumbCurrencies {
    static let shared = BithumbCurrencies()
    let currencyNameString: [String] = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM", "BTG", "EOS", "ICX", "VET", "TRX", "ELF", "MITH", "MCO", "OMG", "KNC", "GNT", "ZIL", "ETHOS", "PAY", "WAX", "POWR", "LRC", "GTO", "STEEM", "STRAT", "ZRX", "REP", "AE", "XEM", "SNT", "ADA", "PPT", "CTXC", "CMT", "THETA", "WTC", "ITC", "TRUE", "ABT", "RNT", "PLY", "WAVES", "LINK", "ENJ", "PST", "SALT", "RDN", "LOOM", "PIVX", "INS", "BCD", "BZNT", "XLM", "OCN", "BSV", "TMTG", "BAT", "WET", "XVG", "IOST", "POLY", "HC", "ROM", "AMO", "ETZ", "ARN", "APIS", "MTL", "DACC", "DAC", "BHP", "BTT", "HDAC", "NPXS", "AUTO", "GXC", "ORBS", "VALOR", "CON", "ANKR", "MIX"]

    var currencyKey: [String: Int] = ["BTC": 0, "ETH": 0, "DASH": 0, "LTC": 0, "ETC": 0, "XRP": 0, "BCH": 0, "XMR": 0, "ZEC": 0, "QTUM": 0, "BTG": 0, "EOS": 0, "ICX": 0, "VET": 0, "TRX": 0, "ELF": 0, "MITH": 0, "MCO": 0, "OMG": 0, "KNC": 0, "GNT": 0, "ZIL": 0, "ETHOS": 0, "PAY": 0, "WAX": 0, "POWR": 0, "LRC": 0, "GTO": 0, "STEEM": 0, "STRAT": 0, "ZRX": 0, "REP": 0, "AE": 0, "XEM": 0, "SNT": 0, "ADA": 0, "PPT": 0, "CTXC": 0, "CMT": 0, "THETA": 0, "WTC": 0, "ITC": 0, "TRUE": 0, "ABT": 0, "RNT": 0, "PLY": 0, "WAVES": 0, "LINK": 0, "ENJ": 0, "PST": 0, "SALT": 0, "RDN": 0, "LOOM": 0, "PIVX": 0, "INS": 0, "BCD": 0, "BZNT": 0, "XLM": 0, "OCN": 0, "BSV": 0, "TMTG": 0, "BAT": 0, "WET": 0, "XVG": 0, "IOST": 0, "POLY": 0, "HC": 0, "ROM": 0, "AMO": 0, "ETZ": 0, "ARN": 0, "APIS": 0, "MTL": 0, "DACC": 0, "DAC": 0, "BHP": 0, "BTT": 0, "HDAC": 0, "NPXS": 0, "AUTO": 0, "GXC": 0, "ORBS": 0, "VALOR": 0, "CON": 0, "ANKR": 0, "MIX": 0]

    var settingCurrencyKey: [String: Int] = [:]
}
