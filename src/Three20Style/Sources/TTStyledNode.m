//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20Style/TTStyledNode.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTStyledNode

@synthesize nextSibling = _nextSibling;
@synthesize parentNode  = _parentNode;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNextSibling:(TTStyledNode*)nextSibling {
	self = [super init];
  if (self) {
    self.nextSibling = nextSibling;
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [self initWithNextSibling:nil];
  if (self) {
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_nextSibling);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setNextSibling:(TTStyledNode*)node {
  if (node != _nextSibling) {
    [_nextSibling release];
    _nextSibling = [node retain];
    node.parentNode = _parentNode;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)outerText {
  return @"";
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)outerHTML {
  if (_nextSibling) {
    return _nextSibling.outerHTML;

  } else {
    return @"";
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)ancestorOrSelfWithClass:(Class)cls {
  if ([self isKindOfClass:cls]) {
    return self;

  } else {
    return [_parentNode ancestorOrSelfWithClass:cls];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) performDefaultAction {
}


@end
