//
//  DexonlineParser.h
//  
//
//  Created by Radu Croitoru on 03/01/15.
//
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"

@interface DexonlineParser : NSObject
- (instancetype) initWithWord:(NSString *)word andXpath:(NSString *)xpath;
- (NSString *)getAllDefinitions;
@end
