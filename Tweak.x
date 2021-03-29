#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
#include <substrate.h>

@interface WKWebView
@property (nonatomic,copy,readonly) NSURL* URL;
-(void)evaluateJavaScript:(id)arg1 completionHandler:(id)arg2;
@end

%hook GFPAdManager
+(void)setupWithPublisherCd:(id)arg1 completionHandler:(id)arg2 { }
%end

//  Thanks to Baw-Appie (A-Font)
//  https://gitlab.com/Baw-Appie/A-Font/-/blob/master/Tweak.xm#L329
%hook WKWebView
-(void)_didFinishNavigation:(id*)arg1 {
  %orig;
  if([[[self URL] host] containsString:@"cafe.naver.com"])
    [self evaluateJavaScript:[NSString stringWithFormat:@"let styles = `\n    .ad_box {\n        Display: none;\n    }\n`\n\nlet styleSheet = document.createElement(\"style\")\nstyleSheet.type = \"text/css\"\nstyleSheet.innerText = styles\ndocument.head.appendChild(styleSheet)\n"] completionHandler:nil];
}

-(void)_didFinishLoadForMainFrame {
  %orig;
  if([[[self URL] host] containsString:@"cafe.naver.com"])
    [self evaluateJavaScript:[NSString stringWithFormat:@"let styles = `\n    .ad_box {\n        Display: none;\n    }\n`\n\nlet styleSheet = document.createElement(\"style\")\nstyleSheet.type = \"text/css\"\nstyleSheet.innerText = styles\ndocument.head.appendChild(styleSheet)\n"] completionHandler:nil];
}
%end


// [self evaluateJavaScript:[NSString stringWithFormat:@"let styles = `\n    .ad_box {\n        Display: none;\n    }\n`\n\nlet styleSheet = document.createElement(\"style\")\nstyleSheet.type = \"text/css\"\nstyleSheet.innerText = styles\ndocument.head.appendChild(styleSheet)\n"] completionHandler:^(NSString* result, NSError* error)
// {
//   NSLog(@"[NoNaverCafeAD] evaluateJavaScript error: %@", error);
//
//   // NSString *saveLocation = @"/tmp/log.txt";
//   // [result writeToFile:saveLocation atomically:YES];
//   NSLog(@"[NoNaverCafeAD] evaluateJavaScript result: %@", result);
// }];
