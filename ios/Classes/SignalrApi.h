// Autogenerated from Pigeon (v1.0.10), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FLTTransport) {
  FLTTransportAuto = 0,
  FLTTransportServerSentEvents = 1,
  FLTTransportLongPolling = 2,
};

typedef NS_ENUM(NSUInteger, FLTConnectionStatus) {
  FLTConnectionStatusConnecting = 0,
  FLTConnectionStatusConnected = 1,
  FLTConnectionStatusReconnecting = 2,
  FLTConnectionStatusDisconnected = 3,
  FLTConnectionStatusConnectionSlow = 4,
  FLTConnectionStatusConnectionError = 5,
};

@class FLTConnectionOptions;
@class FLTStatusChangeResult;

@interface FLTConnectionOptions : NSObject
@property(nonatomic, copy, nullable) NSString * baseUrl;
@property(nonatomic, copy, nullable) NSString * hubName;
@property(nonatomic, copy, nullable) NSString * queryString;
@property(nonatomic, strong, nullable) NSArray<NSString *> * hubMethods;
@property(nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> * headers;
@property(nonatomic, assign) FLTTransport transport;
@end

@interface FLTStatusChangeResult : NSObject
@property(nonatomic, copy, nullable) NSString * connectionId;
@property(nonatomic, assign) FLTConnectionStatus status;
@property(nonatomic, copy, nullable) NSString * errorMessage;
@end

/// The codec used by FLTSignalRHostApi.
NSObject<FlutterMessageCodec> *FLTSignalRHostApiGetCodec(void);

@protocol FLTSignalRHostApi
- (void)connectConnectionOptions:(nullable FLTConnectionOptions *)connectionOptions completion:(void(^)(NSString *_Nullable, FlutterError *_Nullable))completion;
- (void)reconnectWithCompletion:(void(^)(NSString *_Nullable, FlutterError *_Nullable))completion;
- (void)stopWithCompletion:(void(^)(FlutterError *_Nullable))completion;
- (void)isConnectedWithCompletion:(void(^)(NSNumber *_Nullable, FlutterError *_Nullable))completion;
- (void)invokeMethodMethodName:(nullable NSString *)methodName arguments:(nullable NSArray<NSString *> *)arguments completion:(void(^)(NSString *_Nullable, FlutterError *_Nullable))completion;
@end

extern void FLTSignalRHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTSignalRHostApi> *_Nullable api);

/// The codec used by FLTSignalRPlatformApi.
NSObject<FlutterMessageCodec> *FLTSignalRPlatformApiGetCodec(void);

@interface FLTSignalRPlatformApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onStatusChangeStatusChangeResult:(nullable FLTStatusChangeResult *)statusChangeResult completion:(void(^)(NSError *_Nullable))completion;
- (void)onNewMessageHubName:(nullable NSString *)hubName message:(nullable NSString *)message completion:(void(^)(NSError *_Nullable))completion;
@end
NS_ASSUME_NONNULL_END
