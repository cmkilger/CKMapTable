//
//  NSMapTable.h
//  CHLayoutManagerTouch
//
//  Created by Cory Kilger on 8/17/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CKMapTable : NSObject {
@private
	CFMutableDictionaryRef dict;
}

+ (id)mapTableWithWeakToStrongObjects;

- (id)initWithWeakToStrongObjects;

- (id)objectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (void)removeObjectForKey:(id)aKey;

@end
