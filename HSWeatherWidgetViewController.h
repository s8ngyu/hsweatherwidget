#import <HSWidgets/HSModernWidgetViewController.h>
#import <PeterDev/libpddokdo.h>

@interface HSWeatherWidgetViewController : HSModernWidgetViewController
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UIImageView *conditionImage;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UILabel *conditionLabel;
@property (nonatomic, strong) UILabel *tempSummaryLabel;
@end

