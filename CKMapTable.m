//
//  NSMapTable.m
//  CHLayoutManagerTouch
//
//  Created by Cory Kilger on 8/17/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "CKMapTable.h"

const void * RetainObject (CFAllocatorRef allocator, const void *value) {
	id object = (id) value;
	[object retain];
	return value;
}

void ReleaseObject (CFAllocatorRef allocator, const void *value) {
	id object = (id) value;
	[object release];
}

CFStringRef CopyDescriptionOfObject (const void * value) {
	id object = (id) value;
	NSString * description = [object description];
	return (CFStringRef) description;
}

Boolean AreObjectsEqual (const void * value1, const void * value2) {
	id object1 = (id) value1;
	id object2 = (id) value2;
	return [object1 isEqual:object2];
}

CFDictionaryKeyCallBacks keyCallbacks = {
	0,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
};

CFDictionaryValueCallBacks valueCallbacks = {
	0,
	RetainObject,
	ReleaseObject,
	CopyDescriptionOfObject,
	AreObjectsEqual,
};

@implementation CKMapTable

+ (id)mapTableWithWeakToStrongObjects {
	return [[[self alloc] initWithWeakToStrongObjects] autorelease];
}

- (id)initWithWeakToStrongObjects {
	if (![super init])
		return nil;
	dict = CFDictionaryCreateMutable(NULL, 0, &keyCallbacks, &valueCallbacks);
	return self;
}

- (id)objectForKey:(id)aKey {
	return (id) CFDictionaryGetValue(dict, aKey);
}

- (void)setObject:(id)anObject forKey:(id)aKey {
	CFDictionarySetValue(dict, aKey, anObject);
}

- (void)removeObjectForKey:(id)aKey {
	CFDictionaryRemoveValue(dict, aKey);
}

@end
