//
//  XMLParser.swift
//  TCTC Student
//
//  Created by Branson Boggia on 10/31/16.
//  Copyright © 2016 Pinetree Studios. All rights reserved.
//

import UIKit

import UIKit

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class XMLParser: NSObject, Foundation.XMLParserDelegate {
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharacters = ""
    
    var delegate : XMLParserDelegate?
    
    
    func startParsingWithContentsOfURL(_ rssURL: URL) {
        let parser = Foundation.XMLParser(contentsOf: rssURL)
        parser!.delegate = self
        parser!.parse()
    }
    
    
    
    //MARK: NSXMLParserDelegate method implementation
    
    private func parserDidEndDocument(_ parser: XMLParser) {
        delegate?.parsingWasFinished()
    }
    
    
    private func parser(_ parser: Foundation.XMLParser, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [AnyHashable: Any]) {
        
        currentElement = elementName
    }
    
    
    private func parser(_ parser: XMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substring(from: 3)
            }
            
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currentDataDictionary)
            }
        }
    }
    
    
    private func parser(_ parser: XMLParser, foundCharacters string: String!) {
        if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
    
    
}
