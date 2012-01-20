#import "Company.h"

@implementation Company 

@synthesize ticker = _ticker;

- (id)initWithTicker:(NSString *)ticker
{
  if (self = [super init]) {
    self.ticker = ticker;
  }
  return self;
}

@end
