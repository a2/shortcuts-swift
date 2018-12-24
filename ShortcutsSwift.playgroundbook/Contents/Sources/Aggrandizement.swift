import Foundation

public enum Aggrandizement {
    public enum DateFormatStyle {
        case none(TimeFormatStyle)
        case short(TimeFormatStyle)
        case medium(TimeFormatStyle)
        case long(TimeFormatStyle)
        case rfc2822
        case iso8601(includeTime: Bool)
        case relative(TimeFormatStyle)
        case custom(String)
        case howLongAgoUntil
    }

    public enum TimeFormatStyle {
        case none
        case short
        case medium
        case long

        var propertyListValue: Any {
            switch self {
            case .none: return "None"
            case .short: return "Short"
            case .medium: return "Medium"
            case .long: return "Long"
            }
        }
    }

    public enum CoercionItemClass {
        case anything
        case appStoreApp
        case article
        case boolean
        case contact
        case date
        case dictionary
        case emailAddress
        case file
        case image
        case iTunesMedia
        case iTunesProduct
        case location
        case mapsLink
        case media
        case number
        case pdf
        case phoneNumber
        case photoMedia
        case place
        case richText
        case safariWebPage
        case text
        case url
        case vCard

        var propertyListValue: String? {
            switch self {
            case .anything: return "WFContentItem"
            case .appStoreApp: return "WFAppStoreAppContentItem"
            case .article: return "WFArticleContentItem"
            case .boolean: return "WFBooleanContentItem"
            case .contact: return "WFContactContentItem"
            case .date: return "WFDateContentItem"
            case .dictionary: return "WFDictionaryContentItem"
            case .emailAddress: return "WFEmailAddressContentItem"
            case .file: return "WFGenericFileContentItem"
            case .image: return "WFImageContentItem"
            case .iTunesMedia: return "WFMPMediaContentItem"
            case .iTunesProduct: return "WFiTunesProductContentItem"
            case .location: return "WFLocationContentItem"
            case .mapsLink: return "WFDCMapsLinkContentItem"
            case .media: return "WFAVAssetContentItem"
            case .number: return "WFNumberContentItem"
            case .pdf: return "WFPDFContentItem"
            case .phoneNumber: return "WFPhoneNumberContentItem"
            case .photoMedia: return "WFPhotoMediaContentItem"
            case .place: return "WFMKMapItemContentItem"
            case .richText: return "WFRichTextContentItem"
            case .safariWebPage: return "WFSafariWebPageContentItem"
            case .text: return nil
            case .url: return "WFURLContentItem"
            case .vCard: return "WFVCardContentItem"
            }
        }
    }

    public enum PropertyName {
        case fileSize
        case fileExtension
        case name
        case custom(String)

        var propertyListValue: Any {
            switch self {
            case .fileSize: return "File Size"
            case .fileExtension: return "File Extension"
            case .name: return "Name"
            case .custom(let propertyName): return propertyName
            }
        }
    }

    public enum PropertyUserInfo {
        case fileSize
        case fileExtension
        case number(Number)

        var propertyListValue: Any {
            switch self {
            case .fileSize: return "WFFileSizeProperty"
            case .fileExtension: return "WFFileExtensionProperty"
            case .number(let number): return number
            }
        }
    }

    case coercion(class: CoercionItemClass)
    case dateFormat(DateFormatStyle)
    case dictionaryValue(key: String?)
    case property(name: PropertyName, userInfo: PropertyUserInfo)

    var propertyList: PropertyList {
        switch self {
        case .coercion(let coercionClass):
            var result: PropertyList = ["Type": "WFCoercionVariableAggrandizement"]
            result["CoercionItemClass"] = coercionClass.propertyListValue
            return result
        case .dateFormat(let format):
            var result: PropertyList = ["Type": "WFDateFormatVariableAggrandizement"]

            switch format {
            case .none(let timeFormatStyle):
                result["WFDateFormatStyle"] = "None"
                result["WFTimeFormatStyle"] = timeFormatStyle.propertyListValue
            case .short(let timeFormatStyle):
                result["WFDateFormatStyle"] = "Short"
                result["WFTimeFormatStyle"] = timeFormatStyle.propertyListValue
            case .medium(let timeFormatStyle):
                result["WFDateFormatStyle"] = "Medium"
                result["WFTimeFormatStyle"] = timeFormatStyle.propertyListValue
            case .long(let timeFormatStyle):
                result["WFDateFormatStyle"] = "Long"
                result["WFTimeFormatStyle"] = timeFormatStyle.propertyListValue
            case .rfc2822:
                result["WFDateFormatStyle"] = "RFC 2822"
            case .iso8601(let includeTime):
                result["WFDateFormatStyle"] = "ISO 8601"
                result["WFISO8601IncludeTime"] = includeTime
            case .relative(let timeFormatStyle):
                result["WFDateFormatStyle"] = "Relative"
                result["WFTimeFormatStyle"] = timeFormatStyle.propertyListValue
                result["WFRelativeDateFormatStyle"] = "Short"
            case .custom(let dateFormat):
                result["WFDateFormatStyle"] = "Custom"
                result["WFDateFormat"] = dateFormat
            case .howLongAgoUntil:
                result["WFDateFormatStyle"] = "Relative"
            }

            return result
        case .dictionaryValue(let key):
            var result: PropertyList = ["Type": "WFDictionaryValueVariableAggrandizement"]
            result["DictionaryKey"] = key
            return result
        case .property(let name, let userInfo):
            return [
                "Type": "WFPropertyVariableAggrandizement",
                "PropertyName": name.propertyListValue,
                "PropertyUserInfo": userInfo.propertyListValue,
            ]
        }
    }
}
