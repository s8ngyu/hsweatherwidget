#import "HSWeatherWidgetViewController.h"

@implementation HSWeatherWidgetViewController
-(void)viewDidLoad {
	[super viewDidLoad];
	[[PDDokdo sharedInstance] refreshWeatherData];

	self.contentView.backgroundColor = UIColor.clearColor;
	self.gradientLayer = [CAGradientLayer layer];
	self.gradientLayer.frame = self.contentView.bounds;

        if (![[NSCalendar currentCalendar] isDate:[[PDDokdo sharedInstance] sunrise] inSameDayAsDate:[[PDDokdo sharedInstance] sunset]]) {
		self.gradientLayer.colors = [NSArray arrayWithObjects: (id)[UIColor colorWithRed:68.0f/255.0f green:138.0f/255.0f blue:183.0f/255.0f alpha:1.0f].CGColor, (id)[UIColor colorWithRed:112.0f/255.0f green:165.0f/255.0f blue:196.0f/255.0f alpha:1.0f].CGColor, nil];
	}

        else if ([[NSCalendar currentCalendar] isDate:[[PDDokdo sharedInstance] sunrise] inSameDayAsDate:[[PDDokdo sharedInstance] sunset]]) {
                self.gradientLayer.colors = [NSArray arrayWithObjects: (id)[UIColor colorWithRed:1.0f/255.0f green:5.0f/255.0f blue:28.0f/255.0f alpha:1.0f].CGColor, (id)[UIColor colorWithRed:49.0f/255.0f green:59.0f/255.0f blue:89.0f/255.0f alpha:1.0f].CGColor, nil];
        }


	[self.contentView.layer insertSublayer:self.gradientLayer atIndex:0];

	[self setCornerRadius: 20];
	self.titleLabel.text = @"Weather";

	self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 13, 120, 20)];
	self.cityLabel.text = [[PDDokdo sharedInstance] currentLocation];
	self.cityLabel.textColor = UIColor.whiteColor;
	self.cityLabel.font = [UIFont systemFontOfSize: 15 weight: UIFontWeightMedium];
	[self.contentView addSubview: self.cityLabel];

	self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 33, 120, 40)];
	self.tempLabel.text = [[PDDokdo sharedInstance] currentTemperature];
	self.tempLabel.textColor = UIColor.whiteColor;
	self.tempLabel.font = [UIFont systemFontOfSize: 45 weight: UIFontWeightThin];
	[self.contentView addSubview: self.tempLabel];

	self.conditionImage = [[UIImageView alloc] initWithFrame:CGRectMake(13, 95, 20, 20)];
	self.conditionImage.image = [[PDDokdo sharedInstance] currentConditionsImage];
	[self.contentView addSubview: self.conditionImage];

	self.conditionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 113, 120, 20)];
	self.conditionLabel.text = [[PDDokdo sharedInstance] currentConditions];
	self.conditionLabel.textColor = UIColor.whiteColor;
	self.conditionLabel.font = [UIFont systemFontOfSize: 12 weight: UIFontWeightRegular];
	[self.contentView addSubview: self.conditionLabel];

	self.tempSummaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 130, 120, 20)];
	self.tempSummaryLabel.text = [NSString stringWithFormat:@"H:%@ L:%@", [[PDDokdo sharedInstance] highestTemperatureIn:[self temperatureUnit]], [[PDDokdo sharedInstance] lowestTemperatureIn:[self temperatureUnit]]];
	self.tempSummaryLabel.textColor = UIColor.whiteColor;
	self.tempSummaryLabel.font = [UIFont systemFontOfSize: 12 weight: UIFontWeightRegular];
	[self.contentView addSubview: self.tempSummaryLabel];
}

-(int)temperatureUnit {
	if (!widgetOptions[@"TemperatureUnit"]) return 0;

	return [widgetOptions[@"TemperatureUnit"] integerValue];
}

-(void)setWidgetOptionValue:(id<NSCoding>)object forKey:(NSString *)key {
	[super setWidgetOptionValue:object forKey:key];

	if ([key isEqualToString:@"TemperatureUnit"]) {
		NSInteger temperatureUnit = [widgetOptions[@"WidgetColor"] integerValue];
		self.tempSummaryLabel.text = [NSString stringWithFormat:@"H:%@ L:%@", [[PDDokdo sharedInstance] highestTemperatureIn:temperatureUnit], [[PDDokdo sharedInstance] lowestTemperatureIn:temperatureUnit]];
	}
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.gradientLayer.frame = self.contentView.bounds;
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	[[PDDokdo sharedInstance] refreshWeatherData];

        if (![[NSCalendar currentCalendar] isDate:[[PDDokdo sharedInstance] sunrise] inSameDayAsDate:[[PDDokdo sharedInstance] sunset]]) {
                self.gradientLayer.colors = [NSArray arrayWithObjects: (id)[UIColor colorWithRed:68.0f/255.0f green:138.0f/255.0f blue:183.0f/255.0f alpha:1.0f].CGColor, (id)[UIColor colorWithRed:112.0f/255.0f green:165.0f/255.0f blue:196.0f/255.0f alpha:1.0f].CGColor, nil];
        }

        else if ([[NSCalendar currentCalendar] isDate:[[PDDokdo sharedInstance] sunrise] inSameDayAsDate:[[PDDokdo sharedInstance] sunset]]) {
                self.gradientLayer.colors = [NSArray arrayWithObjects: (id)[UIColor colorWithRed:1.0f/255.0f green:5.0f/255.0f blue:28.0f/255.0f alpha:1.0f].CGColor, (id)[UIColor colorWithRed:49.0f/255.0f green:59.0f/255.0f blue:89.0f/255.0f alpha:1.0f].CGColor, nil];
        }


	self.cityLabel.text = [[PDDokdo sharedInstance] currentLocation];
	self.tempLabel.text = [[PDDokdo sharedInstance] currentTemperature];
	self.conditionImage.image = [[PDDokdo sharedInstance] currentConditionsImage];
	self.conditionLabel.text = [[PDDokdo sharedInstance] currentConditions];
	self.tempSummaryLabel.text = [NSString stringWithFormat:@"H:%@ L:%@", [[PDDokdo sharedInstance] highestTemperatureIn:[self temperatureUnit]], [[PDDokdo sharedInstance] lowestTemperatureIn:[self temperatureUnit]]];
}

+(HSWidgetSize)minimumSize {
	return HSWidgetSizeMake(2, 2);
}
@end
