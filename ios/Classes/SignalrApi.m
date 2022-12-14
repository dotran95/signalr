// Autogenerated from Pigeon (v1.0.10), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "SignalrApi.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

@interface FLTConnectionOptions ()
+ (FLTConnectionOptions *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTStatusChangeResult ()
+ (FLTStatusChangeResult *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTConnectionOptions
+ (FLTConnectionOptions *)fromMap:(NSDictionary *)dict {
  FLTConnectionOptions *result = [[FLTConnectionOptions alloc] init];
  result.baseUrl = dict[@"baseUrl"];
  if ((NSNull *)result.baseUrl == [NSNull null]) {
    result.baseUrl = nil;
  }
  result.hubName = dict[@"hubName"];
  if ((NSNull *)result.hubName == [NSNull null]) {
    result.hubName = nil;
  }
  result.queryString = dict[@"queryString"];
  if ((NSNull *)result.queryString == [NSNull null]) {
    result.queryString = nil;
  }
  result.hubMethods = dict[@"hubMethods"];
  if ((NSNull *)result.hubMethods == [NSNull null]) {
    result.hubMethods = nil;
  }
  result.headers = dict[@"headers"];
  if ((NSNull *)result.headers == [NSNull null]) {
    result.headers = nil;
  }
  result.transport = [dict[@"transport"] integerValue];
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.baseUrl ? self.baseUrl : [NSNull null]), @"baseUrl", (self.hubName ? self.hubName : [NSNull null]), @"hubName", (self.queryString ? self.queryString : [NSNull null]), @"queryString", (self.hubMethods ? self.hubMethods : [NSNull null]), @"hubMethods", (self.headers ? self.headers : [NSNull null]), @"headers", @(self.transport), @"transport", nil];
}
@end

@implementation FLTStatusChangeResult
+ (FLTStatusChangeResult *)fromMap:(NSDictionary *)dict {
  FLTStatusChangeResult *result = [[FLTStatusChangeResult alloc] init];
  result.connectionId = dict[@"connectionId"];
  if ((NSNull *)result.connectionId == [NSNull null]) {
    result.connectionId = nil;
  }
  result.status = [dict[@"status"] integerValue];
  result.errorMessage = dict[@"errorMessage"];
  if ((NSNull *)result.errorMessage == [NSNull null]) {
    result.errorMessage = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.connectionId ? self.connectionId : [NSNull null]), @"connectionId", @(self.status), @"status", (self.errorMessage ? self.errorMessage : [NSNull null]), @"errorMessage", nil];
}
@end

@interface FLTSignalRHostApiCodecReader : FlutterStandardReader
@end
@implementation FLTSignalRHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTConnectionOptions fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTSignalRHostApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTSignalRHostApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTConnectionOptions class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTSignalRHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTSignalRHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTSignalRHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTSignalRHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTSignalRHostApiGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    FLTSignalRHostApiCodecReaderWriter *readerWriter = [[FLTSignalRHostApiCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


void FLTSignalRHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTSignalRHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SignalRHostApi.connect"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(connectConnectionOptions:completion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(connectConnectionOptions:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTConnectionOptions *arg_connectionOptions = args[0];
        [api connectConnectionOptions:arg_connectionOptions completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SignalRHostApi.reconnect"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(reconnectWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(reconnectWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api reconnectWithCompletion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SignalRHostApi.stop"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(stopWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api stopWithCompletion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SignalRHostApi.isConnected"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(isConnectedWithCompletion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(isConnectedWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api isConnectedWithCompletion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SignalRHostApi.invokeMethod"
        binaryMessenger:binaryMessenger
        codec:FLTSignalRHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(invokeMethodMethodName:arguments:completion:)], @"FLTSignalRHostApi api (%@) doesn't respond to @selector(invokeMethodMethodName:arguments:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_methodName = args[0];
        NSArray<NSString *> *arg_arguments = args[1];
        [api invokeMethodMethodName:arg_methodName arguments:arg_arguments completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FLTSignalRPlatformApiCodecReader : FlutterStandardReader
@end
@implementation FLTSignalRPlatformApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTStatusChangeResult fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTSignalRPlatformApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTSignalRPlatformApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTStatusChangeResult class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTSignalRPlatformApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTSignalRPlatformApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTSignalRPlatformApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTSignalRPlatformApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTSignalRPlatformApiGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    FLTSignalRPlatformApiCodecReaderWriter *readerWriter = [[FLTSignalRPlatformApiCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


@interface FLTSignalRPlatformApi ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation FLTSignalRPlatformApi
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)onStatusChangeStatusChangeResult:(nullable FLTStatusChangeResult *)arg_statusChangeResult completion:(void(^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.SignalRPlatformApi.onStatusChange"
      binaryMessenger:self.binaryMessenger
      codec:FLTSignalRPlatformApiGetCodec()];
  [channel sendMessage:@[arg_statusChangeResult] reply:^(id reply) {
    completion(nil);
  }];
}
- (void)onNewMessageHubName:(nullable NSString *)arg_hubName message:(nullable NSString *)arg_message completion:(void(^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.SignalRPlatformApi.onNewMessage"
      binaryMessenger:self.binaryMessenger
      codec:FLTSignalRPlatformApiGetCodec()];
  [channel sendMessage:@[arg_hubName, arg_message] reply:^(id reply) {
    completion(nil);
  }];
}
@end
