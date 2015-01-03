//
//  DexonlineParser.m
//  
//
//  Created by Radu Croitoru on 03/01/15.
//
//

#import "DexonlineParser.h"

@interface DexonlineParser()
@property (strong, nonatomic) NSString *word;
@property (strong, nonatomic) NSString *xpath;
@end

@implementation DexonlineParser

- (instancetype) initWithWord:(NSString *)word andXpath:(NSString *)xpath {
    self = [super init];
    
    if (self) {
        if (!_word) _word = [[NSString alloc] initWithString:word];
        if (!_xpath) _xpath = [[NSString alloc] initWithString:xpath];
    }
    
    return self;
    
}

- (NSString *)getAllDefinitions {
    NSMutableString *dex = [[NSMutableString alloc] initWithString:@"http://dexonline.ro/definitie/"];
    [dex appendString:self.word];
    
    NSData  *data      = [NSData dataWithContentsOfURL:[NSURL URLWithString:dex]];
    TFHpple *doc       = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *elements  = [doc searchWithXPathQuery:self.xpath];
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    
    for (TFHppleElement *el in elements) {
        for (TFHppleElement *child in el.children) {
            if (child.content != nil) {
                [result appendString:child.content];
            }
            if ([child.children count]!= 0) {
                for (TFHppleElement *grandchild in child.children) {
                    if (grandchild.content != nil) {
                        [result appendString:grandchild.content];
                    }
                    
                }
            }
        }
    }
    
    return result;
    
}

@end
