//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let galaxie = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "GAS", "APD", "AKAM", "AA", "AGN", "ALXN", "ADS", "ALL", "MO", "AMZN", "AEE", "AAL", "AEP", "AXP", "AIG", "AMT", "AMP", "ABC", "AME", "AMGN", "APH", "APC", "ADI", "AON", "APA", "AIV", "AMAT", "ADM", "AIZ", "T", "ADSK", "ADP", "AN", "AZO", "AVGO", "AVB", "AVY", "BHI", "BLL", "BAC", "BK", "BCR",  "BAX", "BBT", "BDX", "BBBY", "BBY", "BLX","HRB","BA", "BWA", "BXP", "BMY", "BRCM", "CHRW", "CA", "COG" , "CAM", "CPB", "COF", "CAH","HSIC", "KMX", "CCL", "CAT", "CBG", "CBS", "CELG", "CNP", "CTL", "CERN", "CF", "SCHW", "CHK", "CVX", "CMG", "CB", "CI", "XEC", "CINF", "CTAS", "CSCO", "C", "CTXS", "CLX", "CME", "CMS", "COH", "KO", "CCE", "CTSH", "CL", "CMCSA", "CMA", "CSC", "CAG", "COP", "CNX", "ED", "CNX", "ED", "GLW", "COST", "CCI", "CSX", "CMI", "CVS", "DHI", "DHR", "DRI", "DVA", "DE", "DLPH", "DAL", "XRAY", "DVN", "DO", "DFS", "DISCA", "DISCK", "DG", "DLTR", "D", "DOV", "DOW", "DPS", "DTE", "DD", "DUK", "DNB", "ETFC", "EMN", "ETN", "EBAY", "ECL", "EIX", "EW", "EA", "EMC", "EMR", "ENDP", "ESV", "ETR", "EOG", "EQT", "EFX", "EQIX", "EQR", "ESS", "EL", "ES", "EXC", "EXPE", "EXPD", "ESRX", "XOM", "FFIV", "FB", "FAST", "FDX", "FIS", "FITB", "FSLR", "FE", "FLIR", "FLS", "FLR", "FMC", "FTI", "F", "FOSL", "BEN", "FCX", "FTR", "GME", "GPS", "GRMN", "GD", "GE", "GGP", "GIS", "GM", "GPC", "GNW", "GILD", "GS", "GT", "GOOGL", "GOOG", "GWW", "HAL", "HBI", "HOG","HRS", "HIG", "HAS", "HCA", "HCP", "HCN", "HP", "HES", "HPQ", "HD", "HON", "HRL",  "HST", "HUM", "HBAN", "ITW", "IR", "INTC", "ICE", "IBM", "IP", "IPG", "IFF", "INTU", "ISRG", "IVZ", "IRM", "JEC", "JBHT", "JNJ", "JPM", "JNPR", "KSU", "K", "KEY", "KMB", "KIM","KMI", "KLAC", "KSS", "KR", "LB", "LLL", "LH", "LRCX", "LM", "LEG", "LEN", "LVLT", "LUK", "LLY", "LNC", "LMT", "L", "LOW", "LYB", "MTB", "MAC", "M", "MNK", "MRO", "MPC", "MAR", "MMC","MLM", "MAS", "MA", "MAT", "MKC", "MCD", "MCK", "MJN", "MMV", "MDT", "MRK", "MET", "KORS", "MCHP", "MU", "MSFT", "MHK", "TAP", "MDLZ", "MON", "MNST", "MCO", "MS", "MOS", "MSI", "MUR", "MYL", "NDAQ", "NOV", "NTAP", "NFLX", "NWL", "NFX", "NEM", "NWSA", "NEE", "NLSN", "NKE", "NI", "NE", "NBL", "JWN", "NSC", "NTRS", "NOC", "NRG", "NUE", "NVDA", "ORLY", "OXY", "OMC", "OKE", "ORCL", "OI", "PCAR", "PH", "PDCO", "PAYX", "PNR", "PBCT", "PEP", "PKI", "PRGO", "PFE", "PCG", "PM", "PSX", "PNW", "PXD", "PBI", "PNC", "RL", "PPG", "PPL", "PX",  "PCLN", "PFG", "PG", "PGR", "PLD", "PRU", "PEG", "PSA", "PHM", "PVH", "PWR", "QCOM", "DGX", "RRC", "RTN", "O", "RHT", "REGN", "RF", "RSG", "RAI", "RHI", "ROK", "COL", "ROP", "ROST", "R", "CRM", "SCG", "SLB", "SNI", "STX", "SEE", "SRE", "SHW", "SPG", "SWKS", "SLG", "SJM", "SNA", "SO", "LUV", "SWN", "SE",  "SWK", "SPLS", "SBUX", "STT", "SRCL", "SYK", "STI", "SYMC", "SYY", "TROW", "TGT", "TEL", "TGNA", "THC", "TDC", "TSO", "TXN", "TXT", "HSY", "TRV", "TMO", "TIF", "TWX", "TMK", "TSS", "TSCO", "RIG", "TRIP", "FOXA", "TSN", "UA", "UNP", "UNH", "UPS", "URI", "UTX", "UHS", "UNM", "URBN", "VFC", "VLO", "VAR", "VTR", "VRSN", "VZ", "VRTX", "VIAB", "V", "VNO", "VMC", "WMT", "WBA", "DIS", "WM", "WAT", "ANTM", "WFC", "WDC", "WU", "WY", "WHR", "WFM", "WMB", "WEC", "WYN", "WYNN", "XEL", "XRX", "XLNX", "XL", "XYL", "YHOO", "YUM", "ZBH", "ZTS"]

class Symbols {
    func segmented(galax:[String], by:Int)-> [[String]] {
        let smallerGroup = Array(galax.prefix(galax.count))
        return smallerGroup.chunked(by: by)
    }
}

extension Collection {
    
    func chunked(by distance: IndexDistance) -> [[Element]] {
        precondition(distance > 0, "distance must be greater than 0") // prevents infinite loop
        
        var index = startIndex
        let iterator: AnyIterator<Array<Element>> = AnyIterator({
            let newIndex = self.index(index, offsetBy: distance, limitedBy: self.endIndex) ?? self.endIndex
            defer { index = newIndex }
            let range = index ..< newIndex
            return index != self.endIndex ? Array(self[range]) : nil
        })
        
        return Array(iterator)
    }
    
}

func convertToMinFrom(seconds:Int)->String {
    let secRemaining = seconds % 60
    let minutes = seconds / 60
    return "\(minutes):\(secRemaining)"
}

func networkCall(ticker:String, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
        // do stuff 1 seconds later
        //print("\(ticker) done")
        completion(true)
    }
}
    
func groupNetworkCall(group:[String], completion: @escaping (Bool) -> Void) {
    var groupCount = 0
    let date_start = NSDate()
    
    for ticker in group {
        networkCall(ticker: ticker, completion: { (finished1) in
            if finished1 {
                //print("finished \(groupCount) of \(group.count) - \(ticker)")
                groupCount += 1
                let timeForFunc:Int = Int(-date_start.timeIntervalSinceNow)
                print("time for func \(convertToMinFrom(seconds: timeForFunc))")
            }
            if groupCount == group.count {
                print("this group finished \(group)")
                completion(true)
            }
        })
    }
}

var storedError: NSError?
let newArray = Symbols().segmented(galax: galaxie, by: 4)

for i in newArray {
    let serial = DispatchQueue(label: "Queuename")

    serial.sync {
            groupNetworkCall(group: i, completion: { (finished) in

                if finished {
                    //print("finished group \(newArray[num])")

                }
            })
    }
}






